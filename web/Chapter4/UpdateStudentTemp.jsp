<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/7
  Time: 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%  Connection conn=null;
    request.setCharacterEncoding("utf-8");
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/jw1";
    String name=request.getParameter("name");
    String pwd = request.getParameter("password");
    String address = request.getParameter("address");
    String id = request.getParameter("id");
    try{  //加载JDBC-ODBC桥驱动程序
        Class.forName(driver);
        conn = DriverManager.getConnection(url,"root","123456"); //建立连接
        //out.print("已成功连接数据库，可以对其进行操作了。");
        String sql="update student set name=?,password=?,address=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, pwd);
        ps.setString(3, address);
        ps.setString(4, id);
        int count=ps.executeUpdate();
        if (count > 0) {
            out.print("update succeeded");
            response.sendRedirect("ListStudentO1.jsp");
        }

    }
    catch(ClassNotFoundException ex){
        out.println(ex.getMessage());     }
    catch(SQLException ex){  out.println(ex.getMessage()); }
    finally{
        if(conn!=null)
            conn.close();
    }
%>
</body>
</html>
