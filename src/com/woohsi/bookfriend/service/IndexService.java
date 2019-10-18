package com.woohsi.bookfriend.service;

import org.springframework.ui.Model;

public interface IndexService {
    public String toRegister(Model model);
    public String toLogin(Model model);
}
