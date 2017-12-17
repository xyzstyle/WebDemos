<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java" %>
<%@ page import="xyz.model.StudentModel" %>
<%@ page import="java.util.List" %>
<%@ page import="xyz.service.PageCount" %>

<%@ include file="CheckPermission.jsp" %>
<html>
<head>
    <title>学生管理</title>
    <%
        String result = (String) request.getAttribute("result");
        if (result != null)
            out.print(result);
    %>

</head>

<body>
<p align="right"><a href="stu.do?method=1">新增用户</a></p>
<table width="550" height="48" border="1" align="center" cellpadding="0" cellspacing="0"
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
        List<StudentModel> students = (List<StudentModel>) request.getAttribute("students");
        for (StudentModel student : students) {
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
        <td align="center"><a href="stu.do?method=4&id=<%=student.getId()%>">修改&nbsp;&nbsp;</a>
            <a href="stu.do?method=3&id=<%=student.getId()%>">删除</a></td>

    </tr>
    <%}%>
    <tr bgcolor="#CCcF90">
        <%
            int currentPage = (int) request.getAttribute("currentPage");
            int maxPageNumber = (int) request.getAttribute("maxPageNumber");
        %>
        <td colspan="5" align="right">当前页数：[<%=currentPage%>]&nbsp;&nbsp;<a
                href='?method=0&pageNumber=1'>第一页</a>&nbsp;&nbsp; <%
            if (currentPage > 1) {
        %><a
                href='?method=0&pageNumber=<%=currentPage - 1%>'>上一页</a> <%
            }
        %>&nbsp;&nbsp;<%
            if (currentPage != maxPageNumber) {
        %><a
                href='?method=0&pageNumber=<%=currentPage + 1%>'>下一页</a>
            <%
                }
            %>&nbsp;&nbsp;<a
                    href='?method=0&pageNumber=<%=maxPageNumber%>'>最后一页</a>&nbsp;&nbsp;
        </td>


    </tr>
</table>
</body>
</html>