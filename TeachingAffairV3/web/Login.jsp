<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
</head>

<body>
<p align="center">用户登录</p>
<form id="form1" name="form1" method="post" action="login.do">
    <table align="center" width="260" border="0">
        <tr>
            <th width="64" scope="row">姓名：</th>
            <%
                String name="";
                String cookieName = "user";
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (int i = 0; i < cookies.length; i++) {
                        Cookie cookie = cookies[i];
                        if (cookieName.equals(cookie.getName())) {
                            name = cookie.getValue();
                        }
                    }
                }
            %>

            <td width="120">
                <input type="text" name="name" id="textfield1" value="<%=name%>"/>
            </td>
        </tr>
        <tr>
            <th scope="row">密码：</th>
            <td><input type="password" name="password" id="textfield2" value=""/></td>
        </tr>

        <tr>
            <td colspan="2" align="center"><input type="reset" name="button" id="button" value="重置"/>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" name="button2" id="button2" value="提交"/></td>
        </tr>
    </table>
</form>
</body>
</html>
