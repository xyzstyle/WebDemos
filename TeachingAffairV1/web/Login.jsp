<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="xyz.model.UserModel"/>
<jsp:useBean id="dao" class="xyz.dao.UserDao"/>
<jsp:setProperty name="user" property="*"/>

<html>
<head>
    <title>Login</title>
</head>
<body>
<%
     if(dao.userLogin(user)){
         session.setAttribute("user","admin");
         out.print("<script language=javascript>alert('登录成功！');window.location.href='ListStudent.jsp';</script>");
     }else{
         out.print("<script language=javascript>alert('登录失败！');history.go(-1);</script>");
     }
%>
</body>
</html>
