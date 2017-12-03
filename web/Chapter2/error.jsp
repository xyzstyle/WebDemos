<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/27
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
This is error page!<br>
error is:<br>
<% out.println(exception.getMessage());%>

</body>
</html>
