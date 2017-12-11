<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/8
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Third JSP</title>
</head>
<body>
Third JSP
<%!
    public String formatStr(String str) {
        return str == null ? "" : str;
    }
%>
<%

    request.setCharacterEncoding("utf-8");
    String name = formatStr(request.getParameter("name"));
    String pwd = formatStr(request.getParameter("pwd"));
    String confirm_pwd = formatStr(request.getParameter("confirm_pwd"));
    String email = formatStr(request.getParameter("email"));
    String gender = formatStr(request.getParameter("gender"));
    String education = formatStr(request.getParameter("education"));
%>
<table border="1" cellspacing="0" cellpadding="0">
    <caption>您注册成功了</caption>
    <tr>
        <td>您的用户名是:</td>
        <td><% out.print(name);%></td>
    </tr>
    <tr>
        <td>您的密码是:</td>
        <td><% out.print(pwd);%></td>
    </tr>
    <tr>
        <td>您的性别是:</td>
        <td><% out.print(gender);%></td>
    </tr>
    <tr>
        <td>您的学历是:</td>
        <td><% out.print(education);%></td>
    </tr>
    <tr>
        <td>您的电子邮箱是:</td>
        <td><% out.print(email);%></td>
    </tr>
    <tr>
        <td>信息：</td>
        <td><%
            ArrayList<String> msg=(ArrayList<String>)request.getAttribute("msg");
            out.print(msg.get(0));
            out.print("<br/>");
            out.print(msg.get(1));
        %></td>
    </tr>
</table>
</body>
</html>
