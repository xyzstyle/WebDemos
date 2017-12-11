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
    <title>Insert title here</title>
</head>
<body>
<%

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
    Connection conn = null;
    Statement stmt = null;
    request.setCharacterEncoding("utf-8");
    int method = Integer.parseInt(request.getParameter("method"));

    String result = "";
    try {
        Class.forName(driver); //加载驱动程序
        conn = DriverManager.getConnection(url, "root", "123456");
        stmt = conn.createStatement();
    } catch (Exception e) {

    }

    switch (method) {
        case 1: {
            String name = request.getParameter("name");
            String mypassword = request.getParameter("password");
            String address = request.getParameter("address");
            String sql1 = "insert into student(name,password,address) values('"
                    + name + "','" + mypassword + "','" + address + "')";//插入记录的SQL语句
            try {
                if (stmt.executeUpdate(sql1) > 0) {
                    result = "添加用户成功!";
                } else {
                    result = "添加用户失败!";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
            request.setAttribute("result",result);
            rd.forward(request, response);

        }
%>
<%
        break;
        case 2: {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String id = request.getParameter("id");
            String sql = "update student set name='" + name
                    + "',password='" + password + "',address='" + address
                    + "'  where id=" + id;

            try {
                if (stmt.executeUpdate(sql) > 0) {
                    out.print("<script language=javascript>alert('修改成功！');window.location.href='ListStudent.jsp';</script>");
                } else {
                    out.print("<script language=javascript>alert('修改失败！');history.go(-1);</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        break;
        case 3:
            String id = request.getParameter("id");
            try {
                String sql3 = "delete from student where id=" + id;
                if (stmt.executeUpdate(sql3) > 0) {
                    out.print("<script language=javascript>alert('删除成功！');window.location.href='ListStudent.jsp';</script>");
                } else {
                    out.print("<script language=javascript>alert('删除失败！');history.go(-1);</script>");
                }

            } catch (Exception e) {

            }

            break;

    }
    try {
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>