<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="xyz.model.StudentModel" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<jsp:useBean id="studentService"
             class="xyz.service.StudentService"/>

<%
    int id = 0;
    StudentModel student = null;
    try {
        id = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {

    }
    if (id != 0) {
        student = studentService.getByID(id);
    }
%>
<body>
<p align="center">学生个人信息数据修改</p>
<form id="form1" name="form1" method="post" action="stu.do?method=2">
    <table align="center" width="260" border="0">
        <% if (student != null) {%>
        <tr>
            <th width="64" scope="row">姓名：</th>
            <td width="120"><input type="text" name="name" id="textfield1"
                                   value="<%=student.getName()%>"/></td>
        </tr>
        <tr>
            <th scope="row">密码：</th>
            <td><input type="password" name="password" id="textfield2"
                       value="<%=student.getPassword()%>"/></td>
        </tr>
        <tr>
            <th scope="row">地址：</th>
            <td><input type="text" name="address" id="textfield3"
                       value="<%=student.getAddress()%>"/></td>
        </tr>
        <tr>

            <td colspan="2" align="center"><input type="reset"
                                                  name="button" id="button" value="重置"/> &nbsp;&nbsp;&nbsp;&nbsp; <input
                    type="submit" name="button2" id="button2" value="修改"/></td>
        </tr>

    </table>
    <input type="hidden" name="id" value="<%=id%>"/>
    <% }%>
</form>

</body>
</html>