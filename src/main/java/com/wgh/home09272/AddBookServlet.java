package com.wgh.home09272;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(urlPatterns = "/home0927-2/addBookServlet")
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //定义编码方式
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        //获取输入值
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String date = req.getParameter("date");
        double price = Double.parseDouble(req.getParameter("price"));
        int amount = Integer.parseInt( req.getParameter("amount"));

        //连接数据库
        //定义变量
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String url="jdbc:mysql:///?user=java&password=java&useSSL=false&useUnicode=true&characterEncoding=UTF-8";
        String sql = "insert into javaee.book(title,author,date,price,amount) value(?,?,?,?,?);";

        //连接数据库
        try {
            new com.mysql.jdbc.Driver();

            connection = DriverManager.getConnection(url);
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, author);
            preparedStatement.setString(3, date);
            preparedStatement.setDouble(4, price);
            preparedStatement.setInt(5, amount);

            int influenceLine = preparedStatement.executeUpdate();

            out.println("<h1>注册成功</h1>\n" +
                    "<h3>titile:" + title + " author:" + author+ " date:" + date+ " price:" + price + " amount:" + amount + "</h3>\n" +
                    "<h4 id='timeout'>3秒后跳转到插入页面</h4>\n" +
                    "<script>\n" +
                    "    var time = 3;\n" +
                    "    var panel= document.getElementById(\"timeout\");\n" +
                    "    setInterval(function () {\n" +
                    "        time--;\n" +
                    "        if(time==0){\n" +
                    "            location.href=\"addBook.jsp\";\n" +
                    "        }" +
                    "        panel.innerText=time+\"秒后跳转到插入页面\";\n" +
                    "},1000)\n" +

                    "</script>");

        }catch (SQLException e){
            //异常
            out.println(e.getMessage());
        }



    }
}
