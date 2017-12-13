<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/12
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dao" class="dao.UserDao"/>
<jsp:useBean id="user" class="model.UserModel"/>
<jsp:setProperty name="user" property="*"/>


<html>
<head>
    <title>Title</title>
</head>
<body>
<%
      if(dao.userLogin(user)){
          session.setAttribute("userLevel","0");
          out.print("<script language=javascript>alert('登录成功！');window.location.href='ListStudent.jsp';</script>");
      } else {
          out.print("<script language=javascript>alert('登录失败！');history.go(-1);</script>");
      }
%>

</body>
</html>
