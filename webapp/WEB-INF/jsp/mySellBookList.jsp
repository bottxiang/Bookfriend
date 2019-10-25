<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>在售书籍</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <script>
        function edit(bkid) {
            $.ajax({
                url : "/book/edit",
                async : true,
                type : "POST",
                data : {
                    "type" : "edit",
                    "bkid" : bkid
                },
                dataType : "json",
                // 成功后开启模态框
                success : showEdit,
                error : function() {
                    alert("请求失败");
                }
            });
        }
        function showEdit(data) {
            $("#bkid").val(data.bkid);
            $("#bkname").val(data.bkname);
            $("#bkprice").val(data.bkprice);
            $("#bkpress").val(data.bkpress);
            $("#bkdescription").val(data.bkdescription);
            $("#status").val(data.status);
            $("#uid").val(data.uid);
            $("#myModal").modal("show");
        }
    </script>
</head>
<body>
<%@include file="head.jsp"%>
    <div class="container">
        <table class="table table-striped table-hover">
            <caption>我的在售书籍列表</caption>
            <tr>
                <th>#</th>
                <th>书名</th>
                <th>详情</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            <c:forEach items="${books}" var="book" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${book.bkname}</td>
                    <td><a href="/book/query?bkid=${book.bkid}">详情</a></td>
                    <td><a href="javascript:void(0)" onclick="edit(${book.bkid})">编辑</a></td>
                    <td><a href="/book/delete?bkid=${book.bkid}">删除</a></td>
                </tr>
            </c:forEach>
        </table>

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">更新书籍信息</h4>
                    </div>
                    <form:form action="/book/update" method="post">
                        <div class="modal-body">
                            <div class="input-group">
                                <span class="input-group-addon">书籍id</span>
                                <input type="text" class="form-control" id="bkid" name="bkid">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">书名</span>
                                <input type="text" class="form-control" id="bkname" name="bkname">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">价格</span>
                                <input type="text" class="form-control" id="bkprice" name="bkprice">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">出版社</span>
                                <input type="text" class="form-control" id="bkpress" name="bkpress">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">书籍描述</span>
                                <input type="text" class="form-control" id="bkdescription" name="bkdescription">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">售出状态</span>
                                <input type="text" class="form-control" id="status" name="status">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">卖家id</span>
                                <input type="text" class="form-control" id="uid" name="uid">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-primary" value="保存">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
