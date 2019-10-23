<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
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


<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
