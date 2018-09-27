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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(urlPatterns="/SignUpCheck")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        HttpSession session = req.getSession();
        String str="用户已存在";

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        boolean signUp = false;

        if(email==null||password==null||email.length()==0||password.length()==0){
            session.setAttribute("uperrcode","email不可为空");
            resp.sendRedirect("home0927-1/signup.jsp");
            return ;
        }else{
            PrintWriter out = resp.getWriter();
            String url = "jdbc:mysql:///?user=java&password=java&useSSL=false&useUnicode=true&characterEncoding=UTF-8";
            Connection connection=null;
            PreparedStatement preparedStatement =null;

            try{
                new Driver();
                connection= DriverManager.getConnection(url);
                preparedStatement = connection.prepareStatement("insert into javaee.user(email,Password) value(?,?); ");
                preparedStatement.setString(1, email);
                preparedStatement.setString(2,password);

                int n = preparedStatement.executeUpdate();
                str+=n;
                if(n>0){

                    //注册成功，返回登录页
                    out.println("<h1>注册成功</h1><h3>email:" + email + " password:" + password + "</h3><h4 id='timeout'>3秒后跳转到登录页</h4><script>\n" +
                            "    var time = 3;\n" +
                            "    var panel= document.getElementById(\"timeout\");\n" +
                            "    setInterval(function () {\n" +
                            "        time--;\n" +
                            "        if(time==0){\n" +
                            "            location.href=\"home0927-1/index.jsp\";\n" +
                            "        }" +
                            "        panel.innerText=time+\"秒后跳转到登录页\";\n" +
                            "},1000)\n" +

                            "</script>");
                    signUp=true;
                }
            }catch(SQLException e){
                out.println(e.getMessage());
//                str=e.getMessage();
            }finally {
                if(preparedStatement!=null){
                    try{
                        preparedStatement.close();
                    }catch (SQLException e){ }
                }
                if(connection!=null){
                    try {
                        connection.close();
                    }catch (SQLException e){ }
                }
                if(!signUp){
                    session.setAttribute("uperrcode", str);
                    resp.sendRedirect("home0927-1/signup.jsp");
                }
            }

        }



    }
}
