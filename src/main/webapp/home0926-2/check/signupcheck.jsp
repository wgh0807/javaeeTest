<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet"%>
    <%!
        private static Connection connection =null;
        static{

        }

        boolean insert(String email,String password) {

            String sql="insert into user(email,password) value(?,?)";
            try{
                new Driver();
                connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/javaee", "java", "java");
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1,email);
                stm.setString(2,password);
                stm.executeUpdate();
                return true;//注册成功
            }catch (SQLException e){
                return false;//注册失败，用户已存在
            }
        }

        boolean select(String email,String password) {
            try {
                String sql = "select password from user where email=? and password=?;";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    return true;//注册成功
                }
                return false;//登录失败，用户名或密码错误
            }catch (SQLException e){
                return false;
            }
        }
    %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if(email==null || email.length()<=0){
        session.setAttribute("uperrcode","email不可为空");
        response.sendRedirect("../signup.jsp");
    }
    else  if (password == null || password.length() <= 0) {
        session.setAttribute("uperrcode", "密码不能为空");
        response.sendRedirect("../signup.jsp");
    }else{
        boolean b = insert(email,password);
        if (b) {
            session.setAttribute("uperrcode", "用户已存在");
            response.sendRedirect("../signup.jsp");
        } else {
            application.setAttribute(email, password);
            out.println("<h1>注册成功</h1><h3>email:" + email + " password:" + password + "</h3><h4 id='timeout'>3秒后跳转到登录页</h4><script>\n" +
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