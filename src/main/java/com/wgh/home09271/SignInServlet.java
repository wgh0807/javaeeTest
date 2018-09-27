package com.wgh.home09271;

import com.mysql.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(urlPatterns = "/SignInCheck1")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTf8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpSession session = req.getSession();

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if(email==null||password==null||email.length()<=0||email.length()<=0){
            session.setAttribute("errcode", "用户和密码不能为空");
            resp.sendRedirect("home0927-1/index.jsp");
            return ;
        }


        PrintWriter out = resp.getWriter();
        String url = "jdbc:mysql:///?user=java&password=java&useUnicode=true&characterEncoding=UTF-8";
        PreparedStatement preparedStatement=null;
        Connection connection=null;
        boolean login = false;


        try {
            new Driver();
            connection= DriverManager.getConnection(url);
            preparedStatement = connection.prepareStatement("select id from javaee.user where email=? and password=?;");
            preparedStatement.setString(1, email);
            preparedStatement.setString(2,password);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
//              out.println("登录成功");
                session.setAttribute("username",email);
                out.println("<h1>登录成功</h1><h4 id='timeout'>3秒后跳转到登录页</h4><script>\n" +
                        "    var time = 3;\n" +
                        "    var panel= document.getElementById(\"timeout\");\n" +
                        "    setInterval(function () {\n" +
                        "        time--;\n" +
                        "        if(time==0){\n" +
                        "            location.href=\"home0927-1/home.jsp\";\n" +
                        "        }" +
                        "        panel.innerText=time+\"秒后跳转到网站首页\";\n" +
                        "},1000)\n" +
                        "</script>");
                login=true;
                return ;
            }
        }catch (SQLException e){
//            out.println("SQLError : " + e.getMessage());
        }finally {
            if(preparedStatement!=null){
                try {
                    preparedStatement.close();
                }catch (SQLException e){
                }
            }
            if(connection!=null){
                try {
                    connection.close();
                }catch (SQLException e){
                }
            }
            if(!login){
                session.setAttribute("errcode", "用户名或密码错误");
                resp.sendRedirect("home0927-1/index.jsp");
            }
        }
    }
}
