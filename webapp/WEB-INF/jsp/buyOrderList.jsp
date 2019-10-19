<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表-购买</title>
</head>
<body>
<c:forEach items="${orders}" var="order" varStatus="status">
    ${status.index}&nbsp;&nbsp;
    ${order.oid}&nbsp;&nbsp;
    ${order.bkname}&nbsp;&nbsp;
    ${order.bkprice}&nbsp;&nbsp;
    ${order.email}<br>
</c:forEach>
</body>
</html>
