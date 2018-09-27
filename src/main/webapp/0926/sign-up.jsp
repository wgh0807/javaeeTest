<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sign up dealing</title>
</head>
<body>
<%
    String email=request.getParameter("email");
    String password = request.getParameter("password");
    request.setAttribute("email",email);
    request.setAttribute("password",password);

//    out.print("email:"+request.getAttribute("email")+"\r\n password:"+request.getAttribute("password"));

    request.getRequestDispatcher("show-sign.jsp").forward(request,response);


%>
</body>
</html>
