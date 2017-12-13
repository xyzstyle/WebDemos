<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>Forward2</title>
</head>
<body>
<h1>Forward2</h1>
<%!
    String getMsg(String name) {
        return name+"'s secret message";
    }
%>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("username");
    request.setAttribute("msg",getMsg(name));
    RequestDispatcher rd = request.getRequestDispatcher("forward3.jsp");
    rd.forward(request, response);
%>
</body>
</html>
