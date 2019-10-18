package com.woohsi.bookfriend.util;

import com.woohsi.bookfriend.po.User;

import javax.servlet.http.HttpSession;

public class MyUtil {
    public static Integer getUserId(HttpSession session) {
        User ruser = (User)session.getAttribute("user");
        return ruser.getUid();
    }
}
