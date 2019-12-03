package com.woohsi.bookfriend.service;

import com.woohsi.bookfriend.dao.NotifyDao;
import com.woohsi.bookfriend.po.Notify;
import com.woohsi.bookfriend.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
@Service("notifyService")
public class NotifyServiceImpl implements NotifyService {
    @Autowired
    private NotifyDao notifyDao;
    @Override
    public String checkNotify(Model model, HttpSession session) {
        List<Notify> notifies = notifyDao.selectNotifyByUid(MyUtil.getUserId(session));
        System.out.println(notifies);
        model.addAttribute("notifies", notifies);
        return "notify";
    }
    @Override
    public String saveNotify(Notify notify) {
        notifyDao.saveNotify(notify);
        return null;
    }

    @Override
    public String clearNotify(HttpSession session) {
        notifyDao.clearNotify(MyUtil.getUserId(session));
        return "notify";
    }

    @Override
    public String deleteNotify(Integer from, Integer to) {
        notifyDao.deleteNotify(from,to);
        return "redirect:/message/check";
    }
}
