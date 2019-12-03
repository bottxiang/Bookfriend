<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
    <div class="regist-form">
    <form:form action="/user/register" method="post" modelAttribute="user"  name="registerForm">
        <h2>用户注册</h2>
        <input type="email" name="email" class="form-control" id="email" placeholder="Email address" value="${user.email}"/>
        <input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
        <input type="password" name="repassword" class="form-control" id="repassword" placeholder="Repeat Password"/>
        <input type="submit" class="btn btn-sm btn-success btn-block" value="注册" />
    </form:form>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
