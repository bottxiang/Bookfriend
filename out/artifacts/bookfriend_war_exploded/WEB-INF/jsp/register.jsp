<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
    <div class="regist">
    <form:form action="/user/register" method="post" modelAttribute="user"  name="registerForm">
        Email:<input type="text" name="email" value="${user.email}" /> ${msg}<br>
        Password: <input type="text" name="password" /><br>
        Repeat password: <input type="text" name="repassword" /><br>
        <input type="submit" value="Sign In" />
    </form:form>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
