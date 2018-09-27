<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8" >
    <title>登录</title>
    <link rel="stylesheet" href="../home0925/assets/css/bootstrap.min.css">
    <script src="../home0925/assets/jquery-3.3.1.js"></script>
    <script src="../home0925/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/signin.css">
</head>
<body>
<div class="container form-signin">
    <%
        String errCode = (String) session.getAttribute("uperrcode");
        session.removeAttribute("uperrcode");
//        out.print("<script>alert(' "+errCode+"');</script>");
        errCode=(errCode!=null && errCode.length()>0)?errCode:"";
    %>
    <form  method="post" action="check/signupcheck.jsp" >
        <h2 class="form-signin-heading text-center">用户注册</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div  id="errcodemsg" class="alert alert-danger"><%=errCode %></div>
        <button class="btn btn-lg btn-primary btn-block " type="submit">注册</button>
        <input type="button" class="btn btn-lg btn-default btn-block " onclick="location.href='index.jsp'" value="返回登录" />
    </form>
</div> <!-- /container -->

</body>
<script>
    $(document).ready(function () {
        errcode1=$("#errcodemsg");
        // alert(errcode1.text())
        if(errcode1.text().length<=0){
            errcode1.hide();
        }else{
            errcode1.show();
        }
    })
</script>
</html>