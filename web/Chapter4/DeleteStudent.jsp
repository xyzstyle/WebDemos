<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection conn = null;
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
    String id = request.getParameter("id");
    try {  //加载MySQL驱动程序
        Class.forName(driver);
        conn = DriverManager.getConnection(url, "root", "123456"); //建立连接
        //.print("已成功连接数据库'教务’，可以对其进行操作了。");
        Statement statement=conn.createStatement();
        String sql="delete from student where id="+id;
        statement.executeUpdate(sql);
        statement.close();


    } catch (ClassNotFoundException ex) {
        out.println(ex.getMessage());
    } catch (SQLException ex) {
        out.println(ex.getMessage());
    } finally {
        if (conn != null)
            conn.close();
    }
    response.sendRedirect("ListStudent.jsp");

%>
</body>
</html>
