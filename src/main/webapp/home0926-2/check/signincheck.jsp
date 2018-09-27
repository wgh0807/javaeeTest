<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午11:17
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
            new Driver();
            connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/javaee", "java", "java");
            String sql = "select password from user where email=? and password=?;";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
//            return rs.toString();

            if (rs.next()) {
                return true;//登录成功
            }
            return false;//登录失败，用户名或密码错误
        }catch (SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if(email==null||password==null||email.length()<=0||email.length()<=0){
        session.setAttribute("errcode", "用户和密码不能为空");
        response.sendRedirect("../index.jsp");
    }else{

        boolean b = select(email,password);

        if(b){
            session.setAttribute("username",email);
            out.println("<h1>登录成功</h1><h4 id='timeout'>3秒后跳转到登录页</h4><script>\n" +
                    "    var time = 3;\n" +
                    "    var panel= document.getElementById(\"timeout\");\n" +
                    "    setInterval(function () {\n" +
                    "        time--;\n" +
                    "        if(time==0){\n" +
                    "            location.href=\"../home.jsp\";\n" +
                    "        }" +
                    "        panel.innerText=time+\"秒后跳转到网站首页\";\n" +
                    "},1000)\n" +
                    "</script>");
        }
        else {
            session.setAttribute("errcode", "用户名或密码错误");
            response.sendRedirect("../index.jsp");
        }
    }

%>
