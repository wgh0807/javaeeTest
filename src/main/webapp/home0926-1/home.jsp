<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../home0925/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/signin.css">
    <script src="../home0925/assets/jquery-3.3.1.min.js"></script>
    <script src="../home0925/assets/js/bootstrap.min.js"></script>
</head>
<body>
<%
    String email = (String) session.getAttribute("username");
    if(email==null || email.equals("null")){
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }
%>
<div class="container">
    <!-- Jumbotron -->
    <div class="jumbotron">
        <h1>Home Page</h1>
        <p class="lead">congratulation you,<%=email%> . that you're sign in my web successful,but here is nothing</p>
        <p>hahahahaha</p>
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
        <%
        session.removeAttribute("username");
        %>
        location.href="index.jsp";
    }
</script>
</html>