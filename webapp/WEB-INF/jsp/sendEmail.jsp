<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <form action="/user/sendEmail" style="margin-top: 200px;" class="form-inline"  method="post">
            <div style="max-width: 300px; margin: 200px auto;">
                <h2>找回密码</h2>
                <input type="email" name="email" placeholder="输入Email找回密码" class="form-control" />
                <input type="submit" class="btn btn-success"value="重置密码"/>
                <p class="help-block">${msg}</p>
            </div>
        </form>
    </div>

    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>
