<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的书籍列表</title>
</head>
<body>我的书籍列表:<br>
    <c:forEach items="${books}" var="book" varStatus="status">
        ${status.index}&nbsp;&nbsp;
        ${book.bkname}&nbsp;&nbsp;
        <a href="/book/query?bkid=${book.bkid}">详情</a>&nbsp;&nbsp;
        <a href="/book/edit?bkid=${book.bkid}">编辑</a>&nbsp;&nbsp;
        <a href="/book/delete?bkid=${book.bkid}">删除</a><br>
    </c:forEach>
</body>
</html>
