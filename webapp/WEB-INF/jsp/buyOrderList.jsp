<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表-购买</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <table class="table table-striped table-hover">
        <tr>
            <th>#</th>
            <th>订单号</th>
            <th>书名</th>
            <th>价格</th>
            <th>卖家联系方式</th>
        </tr>
        <c:forEach items="${orders}" var="order" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${order.oid}</td>
                <td>${order.bkname}</td>
                <td>${order.bkprice}</td>
                <td>${order.email}</td>
            </tr>
        </c:forEach>
    </table>


    <script src="https://cdn.bootcss.com/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>
