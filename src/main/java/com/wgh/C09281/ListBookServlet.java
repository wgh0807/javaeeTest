package com.wgh.C09281;

import com.wgh.obj.Book;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.LinkedList;
import com.mysql.jdbc.Driver;

@WebServlet(urlPatterns = "/home0928-1/listBook")
public class ListBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码方式
        resp.setContentType("text/html charset=UTF-8");
        HttpSession session = req.getSession();
        PrintWriter out=resp.getWriter();

        //查询数据库并且返回结果
        //定义数据
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String url="jdbc:mysql:///?user=java&password=java&useSSL=false&useUnicode=true&characterEncoding=UTF-8";
        String sql = "select * from javaee.book order by id desc;";
        LinkedList<Book> books = new LinkedList<>();


        //连接数据库
        try{
            new Driver();
            connection = DriverManager.getConnection(url);
            preparedStatement = connection.prepareStatement(sql);

            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()){
                Integer id = rs.getInt("id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String date = rs.getString("date");
                Double price = rs.getDouble("price");
                Integer amont = rs.getInt("amount");
                books.add(new Book(id,title,author,date,price,amont));
            }
            session.setAttribute("books",books);
            resp.sendRedirect("displayBook.jsp");
        }catch (SQLException sqlEx){
            out.println(sqlEx.getMessage());
        }finally {
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
}
