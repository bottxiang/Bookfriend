<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.woohsi.bookfriend.util.MyUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
<div class="container">
    <form:form action="/book/save" cssClass="form-addbook well well-lg" modelAttribute="book" method="post">
        <h2>添加书籍</h2>
        <label for="bkname">书名：</label>
        <input type="text" class="form-control" id="bkname" name="bkname">
        <label for="bkprice">价格：</label>
        <input type="text" class="form-control" id="bkprice" name="bkprice">
        <label for="bkpress">出版社：</label>
        <input type="text" class="form-control" id="bkpress" name="bkpress">
        <label for="bkdescription">描述：</label>
        <input type="text" class="form-control" id="bkdescription" name="bkdescription">
        <label for="status">售卖状态：</label>
        <input type="radio" id="status" name="status" value="0" checked>未售出
        <input type="radio" id="status" name="status" value="1">已售出
        <input type="hidden" class="form-control" name="uid" value="<%=MyUtil.getUserId(session)%>">
        <input type="submit" class="form-control btn btn-success btn-sm" value="发布">
    </form:form>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
