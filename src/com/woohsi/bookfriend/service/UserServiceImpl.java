package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.dao.UserDao;
import com.woohsi.bookfriend.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;
import java.util.List;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public String register(User user, Model model, HttpSession session, String code) {
        int n = userDao.register(user);
        if (n > 0) {
            return "login";
        } else {
            model.addAttribute("msg", "注册失败！");
            return "register";
        }
    }

    @Override
    public String login(User user, Model model, HttpSession session, String code) {
        List<User> list = userDao.login(user);
        User ruser = null;
        if (list.size() > 0) {
             ruser = list.get(0);
        }
        if (ruser != null) {
            session.setAttribute("user", ruser);
            return "redirect:/index";
        } else {
            model.addAttribute("msg", "用户名或密码错误，请重新登录!");
            return "login";
        }
    }
}
