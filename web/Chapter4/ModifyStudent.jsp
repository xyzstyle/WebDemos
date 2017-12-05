<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改用户信息</title>
</head>


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
        String id = request.getParameter("id");
        String sql = "select * from student where id=" + id;
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
%>
<body>
<p align="center">个人信息数据</p>
<form id="form1" name="form1" method="post" action="UpdateStudent.jsp?id=<%=id%>">
    <table align="center" width="260" border="0">
        <tr>
            <th width="64" scope="row">姓名：</th>
            <td width="120">
                <input type="text" name="name" id="textfield1" value="<%=rs.getString(2)%>"/>
            </td>
        </tr>
        <tr>
            <th scope="row">密码：</th>
            <td><input type="password" name="password" id="textfield2" value="<%=rs.getString(3)%>"/></td>
        </tr>
        <tr>
            <th scope="row">地址：</th>
            <td><input type="text" name="address" id="textfield3" value="<%=rs.getString(4)%>"/></td>
        </tr>
        <tr>

            <td colspan="2" align="center"><input type="reset" name="button" id="button" value="重置"/>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" name="button2" id="button2" value="提交"/></td>
        </tr>
        <input type="hidden" name="id" value="<%=id%>"/>
    </table>

    <%
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    %>
</form>
</body>
</html>