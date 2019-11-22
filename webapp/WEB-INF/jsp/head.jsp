<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<div class="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand " href="/index">Bookfriend</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${user.uid==null}">
                        <li><a href="/toLogin">登录</a></li>
                    </c:if>
                    <c:if test="${user.uid!=null}">
                        <%--书籍管理--%>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">书籍管理 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/toAddBook">发布书籍</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/book/list-mysell">在售书籍</a></li>
                            </ul>
                        </li>
                        <%--订单管理--%>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">订单 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/order/list-buy">我买的</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/order/list-sell">我卖的</a></li>
                            </ul>
                        </li>
                        <%--消息管理--%>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">消息 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/order/list-buy">查看消息</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">---</a></li>
                            </ul>
                        </li>
                        <%--个人中心--%>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/user/userInfo">用户个人信息</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/user/exit">退出</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
                <form action="/book/search" class="navbar-form navbar-right">
                    <div class="form-group">
                        <input type="text" name="keyword" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-success">搜索</button>
                </form>
            </div>
        </div><!-- /.container-fluid -->
    </nav>
</div>