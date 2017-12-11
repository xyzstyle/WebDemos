<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="com.xyz.User"/>
<jsp:setProperty name="user" property="*"/>

Output:
<br/>
姓名：<jsp:getProperty name="user" property="name"/><br/>
密码：<jsp:getProperty name="user" property="password"/><br/>
地址：<jsp:getProperty name="user" property="address"/>

</body>
</html>
