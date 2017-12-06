<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    final String url = "jdbc:mysql://127.0.0.1:3306/db_blog";
    final String userName = "root";
    final String password = "123456";
    String result = "";
    request.setCharacterEncoding("UTF-8");
    String vId = request.getParameter("id");
    String mySql;
    Connection con = null;
    Statement stmt = null;
    int method = Integer.parseInt(request.getParameter("method"));

    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, userName, password);
        stmt = con.createStatement();
    } catch (SQLException ex) {
    }
    if (method == 0) {
        String voteName = request.getParameter("voteName");
        try {
            mySql = "insert into tb_vote(voteName,voteNumber) values('" + voteName + "',0)";
            if (stmt.executeUpdate(mySql) > 0) {
                result = "添加投票内容成功!";
            } else {
                result = "添加投票内容失败!";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
%>
<jsp:forward page="back_VoteAdd.jsp">
    <jsp:param name="result" value="<%=result%>"/>
</jsp:forward>
<%
    }
    if (method == 1) {
        try {
            mySql = "delete  from tb_vote where id=" + vId;
            out.print(mySql);
            if (stmt.executeUpdate(mySql) > 0) {
                out.print(
                        "<script language=javascript>alert('删除此投票内容成功！');window.location.href='back_VoteSelect.jsp';</script>");
            } else {
                out.print("<script language=javascript>alert('删除此投票内容失败！');history.go(-1);</script>");
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
%>

</body>
</html>