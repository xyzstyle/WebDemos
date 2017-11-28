<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/27
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Out Test</title>
</head>
<body>
<%
    out.println("欢迎来到 JSP：内置对象");
    //out.print("<br/>");
    out.write("欢迎来到 JSP：内置对象");
    int i=5;
    out.print("<br/>");
    out.print(i);

    out.write(i);
%>
</body>
</html>
