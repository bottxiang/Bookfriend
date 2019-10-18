package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.po.User;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface UserService {
    public String register(User user, Model model, HttpSession session, String code);
    public String login(User user,Model model, HttpSession session, String code);
}
