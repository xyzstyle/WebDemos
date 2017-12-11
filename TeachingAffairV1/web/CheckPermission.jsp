<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
   if(session.getAttribute("user")==null||!(session.getAttribute("user")).equals("admin")){
       response.sendRedirect("login.html");
   }
%>
</body>
</html>
