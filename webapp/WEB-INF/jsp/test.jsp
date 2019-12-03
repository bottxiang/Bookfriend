<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
<form action="/order/save" method="post">
    <div class="big-book-item">
        <div class="book-img"  >
            <img src="/images/default_book.png">
        </div>
        <div class="book-detail">
            <div>书名：${book.bkname}</div>
            <div>价格：${book.bkprice}</div>
            <p>描述：${book.bkdescription}</p>
            <div>售卖状态：${book.status==0?"未售出":"已售出"}</div>
            <div><a href="#">联系卖家</a></div>
            <input type="hidden" name="bkid" value="${book.bkid}"/>
            <input type="hidden" name="suid" value="${book.uid}"/>
            ${book.status==0?"<input type=\"submit\" value=\"购买\"/>":"btn-none"}
        </div>
    </div>
</form>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
