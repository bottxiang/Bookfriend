package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.po.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService {
    @Override
    public String toRegister(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @Override
    public String toLogin(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }
}
