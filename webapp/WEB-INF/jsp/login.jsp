<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<div class="container">
    <form:form action="/user/login" cssStyle="max-width: 330px; margin: 100px auto auto auto;" method="post" modelAttribute="user"  name="loginForm">
        <div class="login-form">
            <h2>用户登录</h2>
            <input type="email" name="email" class="form-control" id="email" placeholder="Email address" value="${user.email}"/>
            <input type="text" name="password" class="form-control" id="password" placeholder="Password"/>
            <c:if test="${msg!=null}">
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        ${msg}
                </div>
            </c:if>
            <input type="submit" class="btn btn-lg btn-success" value="Login" />
            没有账号？<a href="/toRegister">立即注册</a>
            <a href="/toFindPwd">找回密码</a>
        </div>
    </form:form>
</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
