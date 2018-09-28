<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/28
  Time: 上午9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加图书</title>
</head>
<body>
<h2>增加图书</h2>
<form action="addBookServlet" method="post">
    <input type="text" placeholder="title" name="title" class="text-input" >
    <input type="text" placeholder="author" name="author" class="text-input" >
    <input type="text" placeholder="date" name="date" class="text-input" >
    <input type="text" placeholder="price" name="price" class="text-input" >
    <input type="text" placeholder="amount" name="amount" class="text-input" >
    <input type="submit" value="提交" class="btn btn-primary" >
</form>


</body>
</html>
