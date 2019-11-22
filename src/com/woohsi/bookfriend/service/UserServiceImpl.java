package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.dao.UserDao;
import com.woohsi.bookfriend.po.User;
import com.woohsi.bookfriend.util.MyUtil;
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
    public String register(User user, Model model) {
        int n = userDao.register(user);
        if (n > 0) {
            return "login";
        } else {
            model.addAttribute("msg", "注册失败！");
            return "register";
        }
    }

    @Override
    public String login(User user, Model model, HttpSession session) {
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

    @Override
    public String sendEmail(Model model, HttpSession session, String email) {
        User user = userDao.selectUserByEmail(email);
        System.out.println(user);
        if (user == null) {
            model.addAttribute("msg", "该邮箱地址不存在！");
            return "sendEmail";
        } else {
            user.setCode(MyUtil.getUuid());
            userDao.updateUser(user);
            String content = "<!DOCTYPE HTML><html><body>" +
                    "<h3>用户 " + user.getEmail() + "：</h3>" +
                    "<p>请点击以下链接重置密码</p>" +
                    "<a href=\"http://localhost:8080/user/toResetPwd?code=" +
                    user.getCode() +
                    "\">重置密码</a>" +
                    "</body></html>";
            MyUtil.sendMail(user.getEmail(), content, "重置密码-书友闲置交易平台");
            return "sendEmailSuccess";
        }
    }

    @Override
    public String toResetPwd(Model model, String code) {
        User user = userDao.selectUserByCode(code);
        if (user != null) {
            model.addAttribute("code", user.getCode());
            return "resetpwd";
        }
        return null;
    }

    @Override
    public String resetPwd(Model model, String password, String code) {
        User user = userDao.selectUserByCode(code);
        System.out.println(user);
        if (user != null) {
            user.setPassword(password);
            user.setCode(null);
            userDao.updateUser(user);
            return "resetPwdSuccess";
        }
        return null;
    }

    @Override
    public String deleteUser(HttpSession session) {
        userDao.deleteUser(MyUtil.getUserId(session));
        System.out.println(MyUtil.getUserId(session));
        session.invalidate();
        return "redirect:/index";
    }

    @Override
    public String changePwd(Model model, HttpSession session, String password, String repassword) {
        User user = userDao.selectUserByUid(MyUtil.getUserId(session));
        user.setPassword(password);
        session.invalidate();
        userDao.updateUser(user);
        return "changePwdSuccess";
    }

}
