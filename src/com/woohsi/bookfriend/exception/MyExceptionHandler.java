package com.woohsi.bookfriend.exception;

import com.woohsi.bookfriend.controller.UserController;
import com.woohsi.bookfriend.po.User;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class MyExceptionHandler implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

        Map<String, Object> model = new HashMap<>();
        model.put("ex", e);
        if (e instanceof NotLoginException) {
            httpServletRequest.setAttribute("user", new User());
            httpServletRequest.setAttribute("msg", "没有登录，请登录！");
            return new ModelAndView("/user/login", model);
        } else {
            return new ModelAndView("/error/error", model);
        }
    }
}
