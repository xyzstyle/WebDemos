<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/27
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
<%!
    int add(int a, int b) {
        return a+b;
    }
%>

<%
    out.println(add(3, 4));
    out.println(add(4, 8));
%>
</body>
</html>
