<%--
  Created by IntelliJ IDEA.
  User: wgh
  Date: 2018/9/26
  Time: 上午11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if(email==null||password==null||email.length()<=0||email.length()<=0){
        session.setAttribute("errcode", "用户和密码不能为空");
        response.sendRedirect("../index.jsp");
    }else{
        String passwd = (String) application.getAttribute(email);

        if(passwd!=null&&!passwd.equals("null") && password.equals(passwd)){
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
            session.setAttribute("errcode", "用户名或密码错误"+passwd);
            response.sendRedirect("../index.jsp");
        }
    }

%>
