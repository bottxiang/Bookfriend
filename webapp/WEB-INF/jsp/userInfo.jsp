<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>用户个人信息</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<div class="container">
    <div class="user-info">
        <img class="avatar" src="/images/avatar.png">
        <div class="detail">
            <p>id：${user.uid}</p>
            <p>邮箱：${user.email}</p>
            <p>注册时间：2019.1.1</p>
            <button type="button" class="btn btn-default btn-sm pull-right">注销账号</button>
            <button type="button" class="btn btn-default btn-sm pull-right">修改密码</button>
        </div>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
