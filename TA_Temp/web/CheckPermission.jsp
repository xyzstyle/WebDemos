<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/12
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(session.getAttribute("userLevel")==null||!session.getAttribute("userLevel").equals("0")){
        response.sendRedirect("Login.jsp");
        return;
    }

%>
</body>
</html>
