<!DOCTYPE html>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.wgh.com.wgh.obj.Book" %>
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

        <div class="col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 main">

            <h2 class="sub-header">书库一览</h2>
            <div class="table-responsive">
                <input type="button" class="btn btn-default btn-sm col-lg-2" value="刷新" onclick="location.href='listBook'">
                <input type="button" class="btn btn-info btn-sm col-lg-2 " value="新增" onclick="window.location.href='listBook'">
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
                    <%
                        Object obj = session.getAttribute("books");

                        if(obj==null ||!(obj instanceof LinkedList) ){
                            response.sendRedirect("listBook");
                        }
                        else {
                            LinkedList<Book> books = (LinkedList<Book>) obj;
                            for (Book book : books) {
                                out.println("<tr>\n" +
                                        "            <td>" + book.getId() + "</td>\n" +
                                        "            <td>" + book.getTitle() + "</td>\n" +
                                        "            <td>" + book.getAuthor() + "</td>\n" +
                                        "            <td>" + book.getDate() + "</td>\n" +
                                        "            <td>" + book.getPrice() + "</td>\n" +
                                        "            <td>" + book.getAmount() + "</td>\n" +
                                        "            <td colspan='2'><a href='#'><span>🖊</span>修改</a> <a href='#'><span>❌</span>删除</a></td>\n" +
                                        "        </tr>");
                            }
                            if (books.size()==0){
                                out.println("<tr><td colspan='8'>未查询到相关内容</td></tr>");
                            }
                        }
                    %>
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