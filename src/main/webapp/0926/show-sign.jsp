<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show</title>
</head>
<body>
    <%
        String str = (String) request.getAttribute("email");
        out.print(str);
    %>
</body>
</html>
