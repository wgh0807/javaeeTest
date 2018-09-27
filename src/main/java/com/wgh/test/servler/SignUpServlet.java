package com.wgh.test.servler;

import com.mysql.jdbc.Driver;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//@WebServlet(urlPatterns = "signup")//1.接收请求
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //处理请求
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        //servlet或者资源文件改变，需要使用 重新发布(shift+F10 redeploy)/重启服务器

        try{
            new Driver();
            String url = "jdbc:mysql:///?user=java&password=java";
            Connection connection = DriverManager.getConnection(url);
            PreparedStatement preparedStatement = connection.prepareStatement("select * from ?;");
            preparedStatement.setString(1,"javaee.user");


        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
