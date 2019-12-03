
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>

<body>
    <%@include file="head.jsp"%>
    <div class="container">
        <c:forEach items="${books}" var="book" varStatus="status">
            <div class="book-item">
                <a href="/book/query?bkid=${book.bkid}">
                    <div class="book-img"  >
                        <img src="/images/${book.bkimg!=null?book.bkimg:"default_book.png"}">
                    </div>
                    <div class="book-detail">
                        <div>书名：${book.bkname}</div>
                        <div>价格：${book.bkprice}</div>
                        <div>卖家ID：${book.uid}</div>
                        <p>描述：${book.bkdescription}</p>

                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
    <hr>

<footer class="footer">
    <div class="container">
        <a href="/toAdminLogin">后台管理</a>
        <p>&copy; 2019 woohsi</p>
    </div>
</footer>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
