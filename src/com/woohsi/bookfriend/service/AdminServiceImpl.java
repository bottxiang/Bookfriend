package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.dao.AdminDao;
import com.woohsi.bookfriend.po.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public String login(Admin admin, Model model, HttpSession session) {
        List<Admin> list = adminDao.login(admin);
        Admin radmin = null;
        if (list.size() > 0) {
            radmin = list.get(0);
        }
        if (admin != null) {
            session.setAttribute("admin", radmin);

            return "redirect:/admin_index";
        } else {
            model.addAttribute("msg", "用户名或密码错误，请重新登录!");
            return "login";
        }
    }
}
