<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/25
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>

<form action="showRegisterMsg.jsp" method="post">
<%--<form action="debugMsg.jsp" method="post">--%>
    <table align="center" border="1" cellspacing="0">
        <caption>请输入注册信息</caption>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="pwd"/></td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td><input type="password" name="confirm_pwd"/></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <label>
                    <select name="gender" id="gender">
                        <option>男</option>
                        <option>女</option>
                    </select>
                </label>

            </td>
        </tr>
        <tr>
            <td>学历</td>
            <td><input type="text" name="education"/></td>
        </tr>
        <tr>
            <td>电子邮箱</td>
            <td><input type="text" name="email"/></td>
        </tr>


        <tr>
            <td colspan="2" align="center"><input type="reset" value="重置"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交"/></td>
        </tr>
    </table>
</form>
</body>
</html>
