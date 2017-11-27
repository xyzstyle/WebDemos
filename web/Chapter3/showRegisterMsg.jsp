<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/27
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册信息</title>
</head>
<body>
<%!
    public String formatStr(String str){
        return str==null?"":str;
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
%>
<div align='center'>

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
    </table>


</div>

</body>
</html>
