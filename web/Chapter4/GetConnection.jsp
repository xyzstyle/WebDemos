<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/4
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Get Connection</title>
</head>
<body>
<%
    Connection conn = null;
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
    try {  //加载MySQL驱动程序
        Class.forName(driver);
        conn = DriverManager.getConnection(url, "root", "123456"); //建立连接
        out.print("已成功连接数据库'教务’，可以对其进行操作了。");
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
