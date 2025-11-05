package webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import webapp.models.Member;
import webapp.models.MemberRepository;
import webapp.models.Role;
import webapp.models.RoleRepository;

@Controller
public class AuthController {

    @Autowired
    MemberRepository repository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    RoleRepository roleRepository;

    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "registered", required = false) String registered, Model model) {
        if (error != null) {
            model.addAttribute("error", "Invalid username or password!");
        }
        if (registered != null) {
            model.addAttribute("message", "Registration successful! Please login.");
        }
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    public String register(Member obj, Model model) {
        if (repository.findByUsername(obj.getUsername()) != null) {
            model.addAttribute("error", "Username is already taken!");
            return "register";
        }
        obj.setPassword(obj.getPassword());
        Role userRole = roleRepository.findByName("USER");
        if (userRole == null) {
            userRole = new Role();
            userRole.setName("USER");
            roleRepository.save(userRole);
        }
        obj.setRole(userRole);
        System.out.println("Saving member: " + obj.getUsername());
        repository.save(obj);
        return "redirect:/login?registered=true";
    }
}
