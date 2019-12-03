<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>登录</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp" %>
<div class="container">
    <form:form action="/user/login" method="post" modelAttribute="user" name="loginForm">
        <div class="login-form">
            <h2>用户登录</h2>
            <input type="email" name="email" class="form-control" id="email" placeholder="Email address"
                   value="${user.email}"/>
            <input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
            <c:if test="${msg!=null}">
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        ${msg}
                </div>
            </c:if>
            <input type="submit" class="btn btn-sm btn-success btn-block" value="登录"/>
            没有账号？<a href="/toRegister">立即注册</a>
            <a href="/toFindPwd">找回密码</a>
        </div>
    </form:form>

</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
