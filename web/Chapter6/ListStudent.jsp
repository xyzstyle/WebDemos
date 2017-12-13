<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<html>
<head>
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
<p align="right"><a href="AddStudent.jsp">新增用户</a></p>
<table width="550" height="48" border="1" align="center" cellpadding="0"  cellspacing="0"
       bordercolor="#FFFFFF">
    <caption style="font-size: x-large">学生管理</caption>
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
    <tr bgcolor="#CCCF90">
        <td align="center"><%=id%>
        </td>
        <td><%=rs.getString(2)%>
        </td>
        <td><%=rs.getString(3)%>
        </td>
        <td><%=rs.getString(4)%>
        </td>
        <td align="center"><a href="ModifyStudent.jsp?id=<%=id%>">修改&nbsp;&nbsp;</a>
            <a href="UserOperatorCenter.jsp?method=3&id=<%=id%>">删除</a></td>

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