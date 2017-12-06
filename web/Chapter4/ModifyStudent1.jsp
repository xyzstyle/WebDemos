<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>修改</title>

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
        //out.print("已成功连接数据库'教务’，可以对其进行操作了。");
        Statement statement = conn.createStatement();
        String sql = "select * from student where id=" + id;
        ResultSet rs = statement.executeQuery(sql);
        rs.next();

%>
<form id="form1" name="form1" method="post" action="UpdateStudent2.jsp?id=<%=id%>">
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
    </table>
</form>
<%
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
