<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forward3</title>
</head>
<body>
<h1>Forward3</h1>
<%
    //request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    String msg = (String) request.getAttribute("msg");
%>
用户名为: <%=username %>
<%="<br/>"%>
信息：<%=msg%>
</body>
</html>
