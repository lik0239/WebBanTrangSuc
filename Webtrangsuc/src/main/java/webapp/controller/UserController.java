package webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import webapp.services.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/createUser")
    public String createUser(@RequestParam String username, @RequestParam String password) {
        userService.createUser(username, password);
        return "User created successfully!";
    }
}
