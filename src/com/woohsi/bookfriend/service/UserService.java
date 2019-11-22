package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.po.User;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface UserService {
    public String register(User user, Model model);
    public String login(User user,Model model, HttpSession session);

    public String sendEmail(Model model, HttpSession session, String email);

    public String toResetPwd(Model model, String code);

    public String resetPwd(Model model, String password, String code);

    public String deleteUser(HttpSession session);

    public String changePwd(Model model, HttpSession session, String password, String repassword);
}
