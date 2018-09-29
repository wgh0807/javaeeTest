<!DOCTYPE html>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.wgh.obj.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/28
  Time: 上午9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>图书管理</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>

<c:if test="${sessionScope.username eq null}">
    <c:redirect url="index.jsp"/>
</c:if>
<c:if test="${sessionScope.books eq null}">
    <c:redirect url="/home0928-1/listBook"/>
</c:if>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">图书管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">图书列表</a></li>
                <li><a href="#">null</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>


<div class="container-fluid">
    <div class="row">

    </div>
    <div class="row">

        <div class="col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 main">
            <h2 class="sub-header">增加图书</h2>
            <form action="addBookServlet" method="post">
                <input type="text" placeholder="title" name="title" class="text-input" >
                <input type="text" placeholder="author" name="author" class="text-input" >
                <input type="text" placeholder="date" name="date" class="text-input" >
                <input type="text" placeholder="price" name="price" class="text-input" >
                <input type="text" placeholder="amount" name="amount" class="text-input" >
                <input type="submit" value="新增" class="btn btn-primary btn-sm" >
            </form>

            <h2 class="sub-header">书库一览</h2>
            <div class="table-responsive">
                <input type="button" class="btn btn-default btn-sm col-lg-2" value="刷新" onclick="location.href='listBook'">
                <%--<input type="button" class="btn btn-info btn-sm col-lg-2 " value="新增" onclick="window.location.href='listBook'">--%>
                <table class="table table-striped ">
                    <thead>
                    <tr>
                        <th>书号</th>
                        <th>标题</th>
                        <th>作者</th>
                        <th>入库日期</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th colspan="2">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${ sessionScope.books[0] ne null }">
                            <c:forEach var="book" items="${sessionScope.books}" varStatus="vs" >
                                <tr>
                                    <td>${book.id}</td>
                                    <td>${book.title}</td>
                                    <td>${book.author}</td>
                                    <td>${book.date}</td>
                                    <td>${book.price}</td>
                                    <td>${book.amount}</td>
                                    <td colspan="2"><a href='#'><span>🖊</span>修改</a> <a href='delBook?id=${book.id}'><span>❌</span>删除</a></td>
                                </tr>
                            </c:forEach>

                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8">未找到相关数据</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach items="${sessionScope.books}" var="book" varStatus="vs" >


                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="../assets/jquery-3.3.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<!--<script src="../../assets/js/vendor/holder.min.js"></script>-->
</body>
</html>