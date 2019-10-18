<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="regist">
    <form:form action="/user/login" method="post" modelAttribute="user"  name="loginForm">
        Email:<input type="text" name="email" value="${user.email}" /><br>
        Password: <input type="text" name="password" /><br>
        ${msg}<br>
        <input type="submit" value="Log In" />
    </form:form>
</div>
</body>
</html>
