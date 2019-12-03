package com.woohsi.bookfriend.controller;

import com.woohsi.bookfriend.po.Admin;
import com.woohsi.bookfriend.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(@ModelAttribute Admin admin, Model model, HttpSession session) {
        return adminService.login(admin, model, session);
    }

    @RequestMapping("/exit")
    public String exit(HttpSession session) {
        session.invalidate();
        return "redirect:/toAdminLogin";
    }
}
