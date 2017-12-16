<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Integer userLevel=(Integer) session.getAttribute("userLevel");

    if (userLevel == null || userLevel!=0) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
</body>
</html>
