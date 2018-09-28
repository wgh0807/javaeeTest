<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="../home0925/assets/css/bootstrap.min.css">
    <script src="../home0925/assets/jquery-3.3.1.js"></script>
    <script src="../home0925/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/signin.css">
</head>
<body>
<div class="container form-signin">
    <%
        String errCode = (String) session.getAttribute("errcode");
        session.removeAttribute("errcode");
        errCode=(errCode!=null && errCode.length()>0)?errCode:"";
    %>
    <form method="post" action="signin" >
        <h2 class="form-signin-heading text-center">用户登录</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" type="text" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div  id="errcode" class="alert alert-danger"><%=errCode %></div>
        <button class="btn btn-lg btn-primary btn-block "  type="submit">登录</button>
        <input type="button" class="btn btn-lg btn-default btn-block " onclick="location.href='signup.jsp'" value="注册" />
    </form>
</div> <!-- /container -->

</body>
<script>
    $(document).ready(function () {
        errcode=$("#errcode");
        if(errcode.text().length<=0){
            errcode.hide();
        }else{
            errcode.show();
        }
    })
</script>
</html>