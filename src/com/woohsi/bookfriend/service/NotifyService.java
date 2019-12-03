package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.po.Notify;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface NotifyService {

    public String checkNotify(Model model, HttpSession session);
    public String saveNotify(Notify notify);
    public String clearNotify(HttpSession session);
    public String deleteNotify(Integer from, Integer to);
}
