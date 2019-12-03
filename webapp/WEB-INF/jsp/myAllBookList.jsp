<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表-购买</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<div class="container">
    <table class="table table-striped table-hover">
        <tr>
            <th>#</th>
            <th>书籍ID</th>
            <th>书名</th>
            <th>详情</th>
            <th>状态</th>
            <th>删除</th>
        </tr>
        <c:forEach items="${books}" var="book" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${book.bkid}</td>
                <td>${book.bkname}</td>
                <td><a href="/book/query?bkid=${book.bkid}"><button type="submit" class="btn btn-primary">详情</button></a></td>
                <td>
                    <c:if test="${book.onsell==0}">
                        <button type="submit" class="btn btn-warning">待审核</button>
                    </c:if>
                    <c:if test="${book.onsell==1}">
                        <button type="submit" class="btn btn-info">已审核</button>
                    </c:if>

                </td>
                <td><a href="/book/delete?bkid=${book.bkid}"><button type="submit" class="btn btn-danger">删除</button></a></td>
            </tr>
        </c:forEach>
    </table>

</div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
