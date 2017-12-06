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
    Connection conn = null;
    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(url, user, password);
        if (!conn.isClosed())
            System.out.println("Succeeded connecting to the Database!");
        PreparedStatement ps = conn.prepareStatement("update student set name=?,password=?,address=?  where id=?");
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String password1 = request.getParameter("password");
        String address = request.getParameter("address");
        ps.setString(1, name);
        ps.setString(2, password1);
        ps.setString(3, address);
        ps.setString(4, id);
        int i = ps.executeUpdate();
        if (i > 0) {
            System.out.print("abc");
        }
        conn.close();
    } catch (Exception ex) {
        out.println(ex.getMessage());
    } finally {
        if (conn != null) conn.close();
    }
    response.sendRedirect("ListStudent.jsp");
%>
</body>
</html>