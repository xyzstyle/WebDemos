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
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    out.println("你输入的姓名是："+name);
    out.println("你输入的密码是："+password);
    out.println("你输入的地址是："+address);
    Connection conn = null;
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
    try {  //加载MySQL驱动程序
        Class.forName(driver);
        conn = DriverManager.getConnection(url, "root", "123456"); //建立连接
        //out.print("已成功连接数据库'教务’，可以对其进行操作了。");
        Statement statement=conn.createStatement();
        String sql="insert into student(name,password,address) values('"+name+"','"+password+"','"+address+"')";
        statement.executeUpdate(sql);
        out.println("你成功的打入了敌人内部");
    } catch (ClassNotFoundException ex) {
        out.println(ex.getMessage());
    } catch (SQLException ex) {
        out.println(ex.getMessage());
    } finally {
        if (conn != null)
            conn.close();
    }

%>
</body>
</html>
