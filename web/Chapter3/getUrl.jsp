<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/28
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public String formatStr(String str) {
        return str == null ? "" : str;
    }
%>
<%
    request.setCharacterEncoding("utf-8");
    String id = formatStr(request.getParameter("id"));
    String name = formatStr(request.getParameter("name"));
    out.print(id);
    out.print("<br/>");
    out.print(name);

    %>
</body>
</html>
