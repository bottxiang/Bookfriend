<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">

</head>

<body>
    <%@include file="head.jsp"%>
    <div class="container">
        <div class="book-item">
            <div class="book-img"  >
                <img src="/images/book_1.jpg">
            </div>
            <div class="book-detail">
                <div>书名：三国演义</div>
                <div>价格：29.9</div>
                <p>描述：至少有一个JAR被扫描用于TLD但尚未包含TLD。 xxxxxxxxxxxxxx为此记录器启用调试日志记录，以获取已扫描但未在其中找到TLD的完整JAR列表。 在扫描期间跳过不需要的JAR可以缩短启动时间和</p>
            </div>
        </div>

    </div>

<footer class="footer">
    <div class="container">
        <p>&copy; 2019 woohsi</p>
    </div>
</footer>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
