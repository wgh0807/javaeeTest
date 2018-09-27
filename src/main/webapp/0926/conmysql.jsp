
<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 下午3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    new Driver();
    Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/javaee", "java", "java");
    String sql = "";
    out.print(connection);
%>
</body>
</html>
