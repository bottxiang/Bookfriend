<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>在售书籍</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
    <div class="container">
        <table class="table table-striped table-hover">
            <caption>我的在售书籍列表</caption>
            <tr>
                <th>#</th>
                <th>书名</th>
                <th>详情</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            <c:forEach items="${books}" var="book" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${book.bkname}</td>
                    <td><a href="/book/query?bkid=${book.bkid}">详情</a></td>
                    <td><a href="/book/edit?bkid=${book.bkid}">编辑</a></td>
                    <td><a href="/book/delete?bkid=${book.bkid}">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
