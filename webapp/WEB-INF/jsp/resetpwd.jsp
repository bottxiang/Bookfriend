<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">
</head>
<body>
<%@include file="head.jsp"%>
    <div class="container">
        <form action="/user/resetPwd"class="form-horizontal" style="margin-top: 200px;">
            <h2 class="col-xs-offset-3">重设密码</h2>
            <div class="form-group">
                <label for="pwd" class="col-xs-2 col-xs-offset-3 control-label">新密码</label>
                <div class="col-xs-4">
                    <input type="text" name="password" class="form-control" id="pwd" placeholder="New password">
                </div>
            </div>
    
            <div class="form-group">
                <label for="repwd" name="password" class="col-xs-2 col-xs-offset-3 control-label">重复新密码</label>
                <div class="col-xs-4">
                    <input type="text" class="form-control" id="repwd" placeholder="Repeat new password">
                </div>
            </div>
            <div class="form-group">
                <input type="hidden" name="code" value="${code}"/>
            </div>
            <div class="form-group">
                <div class="col-xs-offset-5 col-xs-4">
                    <button type="submit" class="btn btn-success">确认</button>
                </div>
            </div>
        </form>
    </div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
