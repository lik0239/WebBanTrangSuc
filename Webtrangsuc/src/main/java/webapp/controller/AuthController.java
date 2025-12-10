package webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import webapp.models.Customer;
import webapp.models.CustomerRepository;
import webapp.models.Member;
import webapp.models.MemberRepository;
import webapp.models.Role;
import webapp.models.RoleRepository;

@Controller
public class AuthController {

    @Autowired private MemberRepository memberRepository;
    @Autowired private RoleRepository roleRepository;
    @Autowired private CustomerRepository customerRepository;

    @GetMapping("/register")
    public String registerPage() { return "register"; }

    @PostMapping("/register")
    @Transactional
    public String doRegister(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String phone,
            @RequestParam String address,
            Model model) {

        try {
            // 1) Validate cơ bản
            if (!password.equals(confirmPassword)) {
                model.addAttribute("error", "Mật khẩu xác nhận không khớp.");
                return "register";
            }
            if (memberRepository.findByUsername(username) != null) {
                model.addAttribute("error", "Tên đăng nhập đã tồn tại.");
                return "register";
            }
            if (customerRepository.findByEmail(email).isPresent()) {
                model.addAttribute("error", "Email đã tồn tại trong hệ thống.");
                return "register";
            }
            if (customerRepository.findByPhone(phone).isPresent()) {
                model.addAttribute("error", "Số điện thoại đã tồn tại trong hệ thống.");
                return "register";
            }

            // 2) Tạo customers mới
            Customer c = new Customer();
            c.setName(name);
            c.setEmail(email);
            c.setPhone(phone);
            c.setAddress(address);
            c = customerRepository.save(c);

            // 3) Lấy role mặc định id=1 (Khách hàng)
            Role customerRole = roleRepository.findById(1L)
                    .orElseThrow(() -> new IllegalStateException("Thiếu role id=1 (Khách hàng). Hãy chèn trước."));

            // 4) Tạo member mới, liên kết 1–1 tới customers
            Member m = new Member();
            m.setUsername(username);
            m.setPassword(password);   // plaintext theo cấu hình hiện tại
            m.setRole(customerRole);
            m.setCustomer(c);
            memberRepository.save(m);

            // 5) Ở lại trang register và báo thành công
            model.addAttribute("success", "Đăng ký thành công! Bạn có thể đăng nhập ngay.");
            return "register";

        } catch (DataIntegrityViolationException ex) {
            ex.printStackTrace();
            model.addAttribute("error", "Dữ liệu đã tồn tại (username/email/phone). Vui lòng kiểm tra lại.");
            return "register";
        } catch (Exception ex) {
            ex.printStackTrace();
            model.addAttribute("error", "Có lỗi khi đăng ký: " + ex.getMessage());
            return "register";
        }
    }

    @GetMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error,
                        @RequestParam(value="registered", required=false) String registered,
                        Model model) {
        if (error != null) model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác!");
        if (registered != null) model.addAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
        return "login";
    }
}
