<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/28
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="includehead.jsp"%>
<table border="1" cellspacing="0" align="center">
    <caption>表格头</caption>
    <tr><td>第一行第一列</td><td>第一行第二列</td></tr>
    <tr><td>第二行第一列</td><td>第二行第二列</td></tr>
</table>
<%@include file="includetail.jsp"%>
</body>
</html>
