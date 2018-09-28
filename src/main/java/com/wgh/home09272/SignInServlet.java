package com.wgh.home09272;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(urlPatterns = "/home0927-2/signin")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //初始化编码方式
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        //页面变量
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        boolean isLogIn = false;
        //获取传入值
        String email = req.getParameter("email");
        String passwrod = req.getParameter("password");
        //数据库变量
        String url = "jdbc:mysql:///?user=java&password=java&useSSL=false&useUnicode=true&characterEncoding=UTF-8";
        String sql = "select username from javaee.user where email=? and password=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try{
            new com.mysql.jdbc.Driver();
            connection= DriverManager.getConnection(url);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, passwrod);

            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                //登录成功，设置用户名并且进行跳转
                isLogIn = true;
                String username = rs.getString("username");
                session.setAttribute("username", username);
                out.println("<h1>登录成功</h1><h4 id='timeout'>3秒后跳转到登录页</h4><script>\n" +
                        "    var time = 3;\n" +
                        "    var panel= document.getElementById(\"timeout\");\n" +
                        "    setInterval(function () {\n" +
                        "        time--;\n" +
                        "        if(time==0){\n" +
                        "            location.href=\"home.jsp\";\n" +
                        "        }" +
                        "        panel.innerText=time+\"秒后跳转到网站首页\";\n" +
                        "},1000)\n" +
                        "</script>");
                return ;
            }

        }catch (SQLException sqlE){
            //数据库异常
            out.println(sqlE.getMessage());
        }finally {
            if (preparedStatement!=null){
                try{
                    preparedStatement.close();
                }catch (SQLException sqlE){}
            }
            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {

                }
            }
            if(!isLogIn){
                //登录失败，用户名或密码错误
                session.setAttribute("errcode", "用户名或密码错误");
                resp.sendRedirect("index.jsp");
            }
        }





    }
}
