<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.woohsi.bookfriend.util.MyUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍</title>
</head>
<body>
<form:form action="/book/saveBook" modelAttribute="book" method="post">
<%--    <fieldset>--%>
<%--        <legend>添加书籍</legend>--%>
<%--        <label>书名</label>--%>
<%--        <form:input path="bkname" />--%>
<%--        <input type="reset" value="Reset"/>--%>
<%--        <input type="submit" value="发布"/>--%>
<%--    </fieldset>--%>
    <table style="border-collapse: collapse">
        <caption>添加书籍</caption>
        <tr>
            <td>书名</td>
            <td>
                <form:input path="bkname"/>
            </td>
        </tr>
        <tr>
            <td>价格</td>
            <td>
                <form:input path="bkprice"/>
            </td>
        </tr>
        <tr>
            <td>出版社</td>
            <td>
                <form:input path="bkpress"/>
            </td>
        </tr>
        <tr>
            <td>书籍描述</td>
            <td>
                <form:input path="bkdescription"/>
            </td>
        </tr>
        <tr>
            <td>售卖状态</td>
            <td>
                <form:input path="status"/>
            </td>
        </tr>
        <tr>
            <td>卖家id</td>
            <td>
                <form:input path="uid" value="<%=MyUtil.getUserId(session)%>" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="reset" value="Reset"/>
                <input type="submit" value="发布"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
