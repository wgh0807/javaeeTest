package com.wgh.home09272;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/home0927-2/signup")
public class SignUpServlet extends HttpServlet {
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

        //获取上一页传来的邮件、昵称、密码 属性
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        //定义需要的变量
        String url = "jdbc:mysql:///?user=java&password=java&useSSL=false&useUnicode=true&characterEncoding=UTF-8";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql ="insert into javaee.user(email,username,password) value(?,?,?)";
        boolean signUp=false;
        PrintWriter out=resp.getWriter();
        HttpSession session = req.getSession();



        //连接数据库并且进行注册及判断
        try{
            new com.mysql.jdbc.Driver();
            connection = DriverManager.getConnection(url);
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1,email);
            preparedStatement.setString(2,username);
            preparedStatement.setString(3,password);

            //如果成功插入说明email主键没有冲突
//            注册成功
            int influenceLine = preparedStatement.executeUpdate();
            signUp=true;
            out.println("<h1>注册成功</h1><h3>email:" + email +" 用户名:" + username + " password:" + password + "</h3><h4 id='timeout'>3秒后跳转到登录页</h4><script>\n" +
                    "    var time = 3;\n" +
                    "    var panel= document.getElementById(\"timeout\");\n" +
                    "    setInterval(function () {\n" +
                    "        time--;\n" +
                    "        if(time==0){\n" +
                    "            location.href=\"index.jsp\";\n" +
                    "        }" +
                    "        panel.innerText=time+\"秒后跳转到登录页\";\n" +
                    "},1000)\n" +

                    "</script>");
            signUp=true;

        }catch (SQLException e){
            if(connection!=null){
                try {
                    connection.close();
                }catch (SQLException sqlEx){
                }
            }
            if(preparedStatement!=null){
                try {
                    preparedStatement.close();
                }catch (SQLException sqlEx){
                }
            }
            if(!signUp){
                //注册失败
                session.setAttribute("uperrcode", "用户已存在");
                resp.sendRedirect("signup.jsp");
            }
        }
    }
}
