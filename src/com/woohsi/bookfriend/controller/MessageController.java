package com.woohsi.bookfriend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/message")
public class MessageController {
    @RequestMapping("/chat")
    public String chat(Model model, String toUser) {
        model.addAttribute("toUser", toUser);
        return "chat";
    }
}
