package webapp.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Set;

@Controller
public class HomeController {
    

    @GetMapping("/")
    public String home(Authentication authentication) {
        if (authentication != null) {
            Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
            if (roles.contains("ROLE_ADMIN")) {
                return "redirect:/admin/home";
            } else if (roles.contains("ROLE_USER")) {
                return "redirect:/user/home";
            }
        }
        return "redirect:/login";
    }
}
