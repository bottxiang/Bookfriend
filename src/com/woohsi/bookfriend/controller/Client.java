package com.woohsi.bookfriend.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.woohsi.bookfriend.po.Message;
import com.woohsi.bookfriend.service.MessageService;
import com.woohsi.bookfriend.service.MessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.ContextLoader;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
@ServerEndpoint("/chat/{sendUser}")
public class Client {
    private MessageService messageService = (MessageService)ContextLoader.getCurrentWebApplicationContext().getBean("messageService");
    // 用户在线数
    private static int onlineCount = 0;
    // 当前的websocket对象
    private static ConcurrentHashMap<Integer, Client> webSocketMap = new ConcurrentHashMap<Integer, Client>();
    // 当前会话,属于websocket的session
    private Session session;
    // 聊天信息
    private Integer sendUser;// 当前用户
    private Integer toUser;// 接收人
    private String message;// 聊天信息

    /**
     * 连接成功
     */
    @OnOpen
    public void onOpen(@PathParam("sendUser") Integer sendUser, Session session) throws IOException {
        this.sendUser = sendUser;
        this.session = session;
        addOnlineCount();
        System.out.println(sendUser + "加入, 当前在线人数为" + getOnlineCount() + " 当前session是" + session.hashCode());
        webSocketMap.put(sendUser, this);//当前用户的websocket
    }

    /**
     * 连接关闭所调用的方法
     */
    @OnClose
    public void onClose() throws IOException {
        // 在线数减1
        subOnlineCount();
        webSocketMap.remove(sendUser);
        System.out.println(sendUser + "关闭, 当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端的消息后所调用的方法
     */
    @OnMessage
    public void onMessage(String jsonMsg, Session session) throws IOException {
        System.out.println(jsonMsg);
        JSONObject jsonObject = JSON.parseObject(jsonMsg);
        //JSONObject jsonOject = JSONObject.fromObject(jsonMsg);
        sendUser = Integer.parseInt(jsonObject.getString("sendUser"));
        toUser = Integer.parseInt(jsonObject.getString("toUser"));
        message = jsonObject.getString("message");

        message = sendUser + ":" + message;
        // 得到接收人
        Client user = webSocketMap.get(toUser);
        if (user != null) {
            user.sendMessage(message);
        }
        this.sendMessage(message);
        //持久化
        Message msg = new Message();
        msg.setFrom(sendUser);
        msg.setTo(toUser);
        msg.setContent(message);
        System.out.println("msg:" + msg);
        messageService.saveMessage(msg);
        System.out.println("信息已保存到数据库");
    }
    /**
     * 发成错误所调用的方法
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        error.printStackTrace();
    }


    public void sendMessage(String message) throws IOException {

        this.session.getBasicRemote().sendText(message);
    }

    // 获得当前在线人数
    public static synchronized int getOnlineCount() {
        return Client.onlineCount;
    }

    // 新用户
    public static synchronized void addOnlineCount() {
        Client.onlineCount++;
    }

    // 移除退出用户
    public static synchronized void subOnlineCount() {
        Client.onlineCount--;
    }
}
