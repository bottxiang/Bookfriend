<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍详情</title>
</head>
<body>
    <div style="text-align: center">
        <h2>${book.bkname}</h2>
        <div>状态：${book.status=0?"未售出":"已售出"}</div>
        <a href="">购买</a>
    </div>
</body>
</html>
