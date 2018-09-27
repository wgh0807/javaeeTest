<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="UTF-8" >
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="assets/jquery-3.3.1.min.js" ></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <title>JSP-Demo2</title>

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right">
                <button type="submit" class="btn btn-success">Sign in</button>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<%!
   String getDate(){
       return new Date().toString();
   }
%>

<div class="container">
    <div class="jumbotron text-center" >
        <h2><span id="time">123</span></h2>
        <h3><%=getDate() %> </h3>
        <p><%=request.getRemoteAddr()%></p>
    </div>
</div>

<div class="panel panel-default">

    <div class="panel-body row text-center" role="listbox">
       <div class="col-md-3">
           <img src="img/timg1.jpeg" width="200px" height="200px" alt="" class="img-circle">
       </div>
        <div class="col-md-3">
            <img src="img/timg2.jpeg" width="200px" height="200px" alt="" class="img-circle">
        </div>
        <div class="col-md-3">
            <img src="img/timg3.jpeg" width="200px" height="200px" alt="" class="img-circle">
        </div>
        <div class="col-md-3">
            <img src="img/timg4.jpeg" width="200px" height="200px" alt="" class="img-circle">
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="text-center">
            copyright®Wang Guanhua 1996-2018
        </p>
    </div>
</footer>



</body>

<script>
    setInterval(function () {
        $("#time").text(new Date().toString());
    },100)
</script>

</html>