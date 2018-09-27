<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午11:34
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if(email==null || email.length()<=0){
        session.setAttribute("uperrcode","email不可为空");
        response.sendRedirect("../signup.jsp");
    }
    else {
        String circlePassword = (String) application.getAttribute(email);
        if (circlePassword != null) {
            session.setAttribute("uperrcode", "用户已存在");
            response.sendRedirect("../signup.jsp");
        } else if (password == null || password.length() <= 0) {
            session.setAttribute("uperrcode", "密码不能为空");
            response.sendRedirect("../signup.jsp");
        }else{
            application.setAttribute(email,password);
            out.println("<h1>注册成功</h1><h3>email:"+email+" password:"+password+"</h3><h4 id='timeout'>3秒后跳转到登录页</h4><script>\n" +
                    "    var time = 3;\n" +
                    "    var panel= document.getElementById(\"timeout\");\n" +
                    "    setInterval(function () {\n" +
                    "        time--;\n" +
                    "        if(time==0){\n" +
                    "            location.href=\"../index.jsp\";\n" +
                    "        }" +
                    "        panel.innerText=time+\"秒后跳转到登录页\";\n" +
                    "},1000)\n" +

                    "</script>");
        }
    }

%>

</body>

</html>


