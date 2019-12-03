<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表-售出</title>
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
            <th>订单号</th>
            <th>书名</th>
            <th>价格</th>
            <th>买家</th>
            <th></th>
        </tr>
        <c:forEach items="${orders}" var="order" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${order.oid}</td>
                <td>${order.bkname}</td>
                <td>${order.bkprice}</td>
                <td><a href="/message/chat?toUser=${order.uid}"><i class="fas fa-sms" style="color: #168539; margin-top: 10px; margin-left: 10px;">联系卖家</i></a></td>
                <td><a href="/order/cancel?oid=${order.oid}&bkid=${order.bkid}&who=seller"><button type="submit" class="btn btn-danger">取消订单</button></a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
