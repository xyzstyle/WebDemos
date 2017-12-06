<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/4
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>

<body>

<%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
    Connection conn = null;
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String password = request.getParameter("pwd");
    String address = request.getParameter("address");
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, "root", "123456");
        if (!conn.isClosed())
            System.out.println("Succeeded connecting to the Database!");
        Statement stmt = conn.createStatement();

        String sql = "insert into student(name,password,address) values('" + name + "','" + password + "','" + address + "')";//插入记录的SQL语句
        stmt.executeUpdate(sql);//执行更新
        stmt.close();
        conn.close();
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    } catch (SQLException e) {
        out.println(e.getMessage());
    } finally {
        if (conn != null)
            conn.close();
    }

%>
<p align="center">您输入的信息为：</p>
<p align="center">你的姓名：<%=name%>
</p>
<p align="center">你的密码：<%=password%>
</p>
<p align="center">您的地址：<%=address%>
</p>

<p align="center">你的信息已经成功存入数据库中</p>
<p><a href="ListStudent.jsp">显示Student表中所有记录</a></p>
</body>
</html>