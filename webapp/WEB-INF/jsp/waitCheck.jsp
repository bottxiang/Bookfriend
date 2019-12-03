<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表-购买</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="admin_head.jsp"%>
<div class="container">
    <table class="table table-striped table-hover">
        <tr>
            <th>#</th>
            <th>书籍ID</th>
            <th>书名</th>
            <th>详情</th>
            <th>审核</th>
        </tr>
        <c:forEach items="${books}" var="book" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${book.bkid}</td>
                <td>${book.bkname}</td>
                <td><a href="/book/query?bkid=${book.bkid}"><button type="submit" class="btn btn-primary">详情</button></a></td>
                <td><a href="/book/setOnSell?bkid=${book.bkid}"><button type="submit" class="btn btn-success">允许上架</button></a></td>
            </tr>
        </c:forEach>
    </table>

</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
