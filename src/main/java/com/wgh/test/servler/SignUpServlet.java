package com.wgh.test.servler;

import com.mysql.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(urlPatterns ="/manage" )
//1.接收请求
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理请求
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("charset=UTF-8");

        PrintWriter out = resp.getWriter();
        //servlet或者资源文件改变，需要使用 重新发布(shift+F10 redeploy)/重启服务器

        try{
            new Driver();
            String url = "jdbc:mysql:///?user=java&password=java&useSSL=false";
            Connection connection = DriverManager.getConnection(url);
            PreparedStatement preparedStatement = connection.prepareStatement("select * from javaee.user where id=?;");
            preparedStatement.setInt(1,1);
//            preparedStatement.setString(1,"javaee.user");

            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()){
                out.println("id:"+ rs.getString("id"));
                out.println("email:"+rs.getString("email"));
                out.println("password:"+ rs.getString("password"));
            }

            out.print("end");




        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理请求
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("charset=UTF-8");

        PrintWriter out = resp.getWriter();
        //servlet或者资源文件改变，需要使用 重新发布(shift+F10 redeploy)/重启服务器

        try{
            new Driver();
            String url = "jdbc:mysql:///?user=java&password=java";
            Connection connection = DriverManager.getConnection(url);
            PreparedStatement preparedStatement = connection.prepareStatement("select * from ?;");
            preparedStatement.setString(1,"javaee.user");
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()){
                out.write(rs.getString("id"));
                out.write(rs.getString("email"));
                out.write(rs.getString("password"));
            }

            out.print("end");




        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
