<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
</head>

<body>
<%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
    String user = "root";
    String password = "123456";
    try {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, user, password);
        if (!conn.isClosed())
            System.out.println("Succeeded connecting to the Database!");
        Statement stmt = conn.createStatement();
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String sql = "delete from student where id=" + id;
        stmt.executeUpdate(sql);
        stmt.close();
        conn.close();
    } catch (Exception ex) {
        out.println(ex.getMessage());
    }
    response.sendRedirect("ListStudent.jsp");
%>
</body>
</html>