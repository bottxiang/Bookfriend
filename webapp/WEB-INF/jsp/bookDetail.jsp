<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍详情</title>
</head>
<body>
<%@include file="head.jsp"%>
    <div style="text-align: center">
        <form action="/order/save" method="post">
            <div>${book.bkname}</div>
            <div>状态：${book.status==0?"未售出":"已售出"}</div>
            <div><a href="#">联系卖家</a></div>
            <input type="hidden" name="bkid" value="${book.bkid}"/>
            <input type="hidden" name="suid" value="${book.uid}"/>
            <input type="submit" value="购买"/>
        </form>

    </div>
</body>
</html>
