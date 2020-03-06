package com.manager.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {

    @GetMapping(value = "/login.html")
    public String login() {
        return "login";
    }
    @GetMapping(value = "/403.html")
    public String noPermission() {
        return "403";
    }

}
