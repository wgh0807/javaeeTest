package com.wgh.C09281;

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

@WebServlet(urlPatterns = "/home0928-1/delBook")
public class DelBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idString = null;
        int id=0;
        try {

            idString = req.getParameter("ip");
            id = Integer.parseInt(idString);
            System.out.println("idString:"+idString +"; id :"+id);
        }catch (Exception e){
            resp.sendRedirect("listBook");
            return ;
        }

        String url = "jdbc:mysql:///?user=java&password=java&useSSL=false&useUnicode=true&characterEncoding=UTF-8";
        String sql = "delete from javaee.book where id = ?;";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            new com.mysql.jdbc.Driver();
            connection = DriverManager.getConnection(url);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);

            preparedStatement.executeUpdate();

            System.out.println("删除成功");

        }catch (SQLException e ){
        }
        finally {
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
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
