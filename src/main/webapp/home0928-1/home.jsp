<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../home0925/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/signin.css">
    <script src="../home0925/assets/jquery-3.3.1.min.js"></script>
    <script src="../home0925/assets/js/bootstrap.min.js"></script>
</head>
<body>

<c:if test="${sessionScope.username eq null}">
    <c:redirect url="index.jsp"/>
</c:if>

<div class="container">
    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>hello ${sessionScope.username}</h1>
        <p class="lead">wel come to snail home page </p>
        <p><a class="btn btn-lg btn-success" href="javascript:void(0)" onclick="location.href='displayBook.jsp'" role="button">图书管理系统</a></p>
        <p><a class="btn btn-lg btn-success" href="javascript:void(0)" onclick="signout()" role="button">注销</a></p>
    </div>


    <!-- Site footer -->
    <footer class="footer">
        <p>&copy; 2016 Company, Inc.</p>
    </footer>

</div> <!-- /container -->
</body>
<script >
    function signout() {
        alert(666);
        <%--<c:remove var="username" scope="session" />--%>
        location.href="signOut";
    }
</script>
</html>
