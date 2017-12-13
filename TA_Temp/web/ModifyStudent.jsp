<%@ page import="model.StudentModel" %><%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dao" class="dao.StudentDao"/>
<html>
<head>
    <title>修改</title>

</head>
<body>
<%
    StudentModel student = dao.queryStudentModel(Integer.parseInt(request.getParameter("id")));

%>
<form id="form1" name="form1" method="post" action="UserOperatorCenter.jsp?method=2&id=<%=student.getId()%>">
    <table align="center" width="260" border="0">
        <tr>
            <th width="64" scope="row">姓名：</th>
            <td width="120">
                <input type="text" name="name" id="textfield1" value="<%=student.getName()%>"/>
            </td>
        </tr>
        <tr>
            <th scope="row">密码：</th>
            <td><input type="password" name="password" id="textfield2" value="<%=student.getPassword()%>"/></td>
        </tr>
        <tr>
            <th scope="row">地址：</th>
            <td><input type="text" name="address" id="textfield3" value="<%=student.getAddress()%>"/></td>
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
