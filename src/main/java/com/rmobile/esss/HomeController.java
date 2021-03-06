package com.rmobile.esss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(HttpSession session) {
        if (session.getAttribute("userLoginInfo") != null) {
            return "home";
        } else {
            return "user/login";
        }

    }

}
