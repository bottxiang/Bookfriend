<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>管理员登录</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="admin_head.jsp" %>
<div class="container">
    <form:form action="/admin/login" method="post" modelAttribute="admin" name="loginForm">
        <div class="login-form">
            <h2>管理员登录</h2>
            <input type="text" name="username" class="form-control" id="username" placeholder="Username"/>
            <input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
            <c:if test="${msg!=null}">
                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        ${msg}
                </div>
            </c:if>
            <input type="submit" class="btn btn-sm btn-success btn-block" value="登录"/>
        </div>
    </form:form>

</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
