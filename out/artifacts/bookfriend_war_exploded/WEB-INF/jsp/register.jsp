<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="regist">
    <form:form action="/user/register" method="post" modelAttribute="user"  name="registerForm">
        Email:<input type="text" name="email" value="${user.email}" /> ${msg}<br>
        Password: <input type="text" name="password" /><br>
        Repeat password: <input type="text" name="repassword" /><br>
        <input type="submit" value="Sign In" />
    </form:form>
    </div>
</body>
</html>
