<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection conn = null;
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String address = request.getParameter("address");
    try {  //加载MySQL驱动程序
        Class.forName(driver);
        conn = DriverManager.getConnection(url, "root", "123456"); //建立连接
        //out.print("已成功连接数据库'教务’，可以对其进行操作了。");
        String sql="update student set name=?,password=?,address=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, password);
        ps.setString(3, address);
        ps.setString(4, id);
        int count=ps.executeUpdate();
        if (count > 0) {
            System.out.println("success");

        }
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
