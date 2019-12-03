package com.woohsi.bookfriend.controller;

import com.google.gson.Gson;
import com.sun.deploy.net.HttpResponse;
import com.woohsi.bookfriend.dao.MessageDao;
import com.woohsi.bookfriend.dao.NotifyDao;
import com.woohsi.bookfriend.po.Message;
import com.woohsi.bookfriend.service.NotifyService;
import com.woohsi.bookfriend.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.resource.HttpResource;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageDao messageDao;
    @Autowired
    private NotifyService notifyService;
    @RequestMapping("/chat")
    public String chat(Model model, String toUser) {
        model.addAttribute("toUser", toUser);
        return "chat";
    }
    @RequestMapping("/history")
    public void loadHistory(HttpServletResponse response, Integer uid) {
        response.setContentType("application/json; charset=utf-8");
        List<Message> messages = messageDao.selectMessageByUid(uid);
        String json = new Gson().toJson(messages);
        System.out.println(json);
        try {
            response.getWriter().write(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/delete_m")
    public void deleteMessage(Integer from, Integer to) {
        messageDao.deleteMessageByUid(from, to);
    }
    @RequestMapping("/delete_n")
    public String deleteNotify(Integer from, Integer to) {
        return notifyService.deleteNotify(from, to);
    }
    @RequestMapping("/check")
    public String checkNotify(Model model, HttpSession session) {
        return notifyService.checkNotify(model, session);
    }
    @RequestMapping("/clear")
    public String clearNotify(HttpSession session) {
        return notifyService.clearNotify(session);
    }
}
