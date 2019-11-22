<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>用户个人信息</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script>
        <%--$(document).ready(function () {--%>
        <%--    $(".conform-delete").click(function () {--%>
        <%--        $.post("/user/delete", {uid: ${user.uid}});--%>
        <%--        $("#delete-account").modal("hide");--%>
        <%--        window.location.href = "/index";--%>
        <%--    });--%>
        <%--});--%>

    </script>
</head>
<body>
<%@include file="head.jsp" %>
<div class="container">
    <div class="user-info">
        <img class="avatar" src="${user.img==null?"/images/avatar.png":"/images/"+user.img}">
        <div class="detail">
            <p>id：${user.uid}</p>
            <p>邮箱：${user.email}</p>
            <p>注册时间：2019.1.1</p>
            <button type="button" class="btn btn-default btn-sm pull-right" data-toggle="modal"
                    data-target="#delete-account">注销账号
            </button>
            <button type="button" class="btn btn-default btn-sm pull-right" data-toggle="modal"
                    data-target="#change-pwd">修改密码</button>
        </div>
    </div>
    <div class="modal fade" id="delete-account" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">警告</h4>
                </div>
                <div class="modal-body">
                    确定要永久删除账户？
                </div>
                <div class="modal-footer">
                    <a href="/user/delete">
                        <button type="button" class="btn btn-danger conform-delete">确定</button>
                    </a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="change-pwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">更新密码</h4>
                </div>
                <form:form action="/user/changePwd" method="post">
                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-addon">密码</span>
                            <input type="text" class="form-control" name="password">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">重复密码</span>
                            <input type="text" class="form-control" name="repassword">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-primary" value="确定">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

                    </div>
                </form:form>
            </div>
        </div>
    </div>

</div>

</body>
</html>
