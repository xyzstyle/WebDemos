<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<%@ page import="model.StudentModel" %>
<%@ page import="java.util.List" %>
<%@ include file="CheckPermission.jsp"%>
<jsp:useBean id="dao" class="dao.StudentDao"/>

<html>
<head>
    <title>学生管理</title>
    <%
        List<StudentModel> students=dao.queryStudentList();
    %>

</head>

<body>
<p align="right"><a href="AddStudent.jsp">新增用户</a></p>
<table width="550" height="48" border="1" align="center" cellpadding="0"  cellspacing="0"
       bordercolor="#FFFFFF">
    <caption style="font-size: x-large">学生管理</caption>
    <tr bgcolor="#CCFF66">
        <th>
            <div align="center">ID编号</div>
        </th>
        <th>
            <div align="center">用户名</div>
        </th>
        <th>
            <div align="center">密码</div>
        </th>
        <th>
            <div align="center">地址</div>
        </th>
        <th>
            <div align="center">操作</div>
        </th>
    </tr>
    <%
       for(StudentModel student:students){
    %>
    <tr bgcolor="#CCCF90">
        <td align="center"><%=student.getId()%>
        </td>
        <td><%=student.getName()%>
        </td>
        <td><%=student.getPassword()%>
        </td>
        <td><%=student.getAddress()%>
        </td>
        <td align="center"><a href="ModifyStudent.jsp?id=<%=student.getId()%>">修改&nbsp;&nbsp;</a>
            <a href="stu.do?method=3&id=<%=student.getId()%>">删除</a></td>

    </tr>
   <%}%>
</table>
</body>
</html>