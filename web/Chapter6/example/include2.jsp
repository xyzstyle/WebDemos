<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Include2</title>
</head>
<body>

<%
    RequestDispatcher rd;
    //out.println("This is include2");
    rd = request.getRequestDispatcher("include3.jsp");
    rd.include(request, response);
    rd = request.getRequestDispatcher("include4.jsp");
    rd.include(request, response);
%>
</body>
</html>
