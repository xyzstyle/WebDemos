<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/27
  Time: 20:11
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
    String name = formatStr(request.getParameter("name"));
    String pwd = formatStr(request.getParameter("password"));
    String confirm_pwd = formatStr(request.getParameter("confirm_pwd"));
    String email = formatStr(request.getParameter("email"));
    String gender = formatStr(request.getParameter("gender"));
    String education = formatStr(request.getParameter("education"));

    if (name.equals(education)) {

    }
    if (pwd.equals(confirm_pwd)) {

    }
    if (email.equals(gender)) {

    }
%>
</body>
</html>
