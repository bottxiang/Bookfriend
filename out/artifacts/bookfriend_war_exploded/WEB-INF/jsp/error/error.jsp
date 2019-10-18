<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>未知错误：</h1><%=exception%>
    <h2>错误内容：</h2>
    <%
        exception.printStackTrace(response.getWriter());
    %>
</body>
</html>
