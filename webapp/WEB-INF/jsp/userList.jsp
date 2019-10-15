<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    User info:<br>
    <c:forEach items="${userList}" var="user" varStatus="status">
        ${status.index}&nbsp;&nbsp;
        ${user.uid}&nbsp;&nbsp;
        ${user.uname}&nbsp;&nbsp;
        ${user.usex}<br>
    </c:forEach>
</body>
</html>
