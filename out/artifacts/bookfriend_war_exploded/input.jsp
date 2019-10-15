<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/select" method="post">
        Input user name:<input type="text" name="uname"/> <br>
        <input type="submit" value="Submit"/>
    </form>
</body>
</html>
