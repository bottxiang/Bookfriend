<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新消息</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@include file="head.jsp"%>


    <div class="container">
        <c:if test="${notifies==null}">
        没有新消息～
        </c:if>
        <c:if test="${notifies!=null}">
            <table class="table table-striped table-hover">
                <tr>
                    <th>#</th>
                    <th>消息来自</th>
                    <th>联系</th>
                    <th>清除</th>
                </tr>
                <c:forEach items="${notifies}" var="notify" varStatus="status">
                    <tr>

                        <td>${status.count}</td>
                        <td>${notify.from}</td>
                        <td><a href="/message/chat?toUser=${notify.from}"><button type="submit" class="btn btn-success">联系</button></a></td>
                        <td><a href="/message/delete_n?from=${notify.from}&to=${notify.to}"><button type="submit" class="btn btn-danger">清除</button></a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>

<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
