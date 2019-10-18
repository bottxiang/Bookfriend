package com.woohsi.bookfriend.controller;

import com.woohsi.bookfriend.exception.NotLoginException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BaseController {
    /**
     * 登录权限控制，在处理方法执行前执行该方法
     */
    @ModelAttribute
    public void isLogin(HttpSession session, HttpServletRequest request) throws NotLoginException {
        if (session.getAttribute("user") == null) {
            throw new NotLoginException("没有登录");
        }
    }
}
