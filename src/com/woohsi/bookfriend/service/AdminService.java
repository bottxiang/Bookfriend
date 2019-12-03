package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.po.Admin;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface AdminService {

    public String login(Admin admin, Model model, HttpSession session);
}
