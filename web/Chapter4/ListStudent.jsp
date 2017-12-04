<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>学生管理</title>

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
            String sql = "select * from student";
            ResultSet rs = stmt.executeQuery(sql);
    %>

</head>

<body>
<table width="550" height="48" border="1" align="center" cellpadding="0" bordercolorlight="#000000" cellspacing="2"
       bordercolor="#FFFFFF">
    <caption>学生管理</caption>
    <tr bgcolor="#CCFF66">
        <th>
            <div align="center">ID编号</div>
        </th>
        <th>
            <div align="center">用户名</div>
        </th>
        <th>
            <div align="center">密码</div>
        </th>
        <th>
            <div align="center">地址</div>
        </th>
        <th>
            <div align="center">操作</div>
        </th>
    </tr>
    <%
        while (rs.next()) {
            int id = rs.getInt(1);
    %>
    <tr bgcolor="#CCcF90">
        <td align="center"><%=id%>
        </td>
        <td><%=rs.getString(2)%>
        </td>
        <td><%=rs.getString(3)%>
        </td>
        <td><%=rs.getString(4)%>
        </td>
        <td align="center"><a href="ModifyStudent.jsp?id=<%=id%>">修改&nbsp;&nbsp;</a>
            <a href="delete.jsp?bhao=<%=id%>">删除</a></td>

    </tr>
    <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    %>
</table>
</body>
</html>