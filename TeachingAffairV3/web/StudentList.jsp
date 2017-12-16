<%@ page contentType="text/html; charset=utf-8" language="java"
         import="java.util.*,xyz.model.StudentModel" errorPage="" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>学生管理</title>
    <jsp:useBean id="studentService" class="xyz.service.StudentService" scope="page"></jsp:useBean>
    <%

        int currentPage = 1;
        int pageCount = 5;
        int recordCounts = studentService.listAllStudents().size();
        int maxPageNumber = 1;
        if (recordCounts % pageCount == 0) {
            maxPageNumber = recordCounts / pageCount;
        } else {
            maxPageNumber = recordCounts / pageCount + 1;
        }
        String pageNumber = request.getParameter("pageNumber");
        if (pageNumber != null) {
            currentPage = Integer.parseInt(pageNumber);
        }
        List<StudentModel> studentList = null;
        studentList = studentService.listStudents(currentPage, pageCount);
    %>

</head>

<body>
<p align="center">
    <font size="5">学生管理</font>
</p>
<p align="right">
    <a href="StudentAdd.jsp">新增学生</a>
</p>
<table width="660" border="1" align="center" cellpadding="0"
       cellspacing="2">
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
        for (StudentModel student : studentList) {
    %>
    <tr bgcolor="#CCcF90">
        <td><%=student.getId()%>
        </td>
        <td><%=student.getName()%>
        </td>
        <td><%=student.getPassword()%>
        </td>
        <td><%=student.getAddress()%>
        </td>
        <td align="center"><a
                href="StudentModify.jsp?id=<%=student.getId()%>">修改&nbsp;&nbsp;</a><a
                href="stu.do?method=3&id=<%=student.getId()%>">删除</a></td>

    </tr>
    <%
        }
    %>
    <tr bgcolor="#CCcF90">
        <td colspan="5" align="right">当前页数：[<%=currentPage%>]&nbsp;&nbsp;<a
                href='?pageNumber=1'>第一页</a>&nbsp;&nbsp; <%
            if (currentPage > 1) {
        %><a
                href='?pageNumber=<%=currentPage - 1%>'>上一页</a> <%
            }
        %>&nbsp;&nbsp;<%
            if (currentPage * pageCount < recordCounts) {
        %><a
                href='?pageNumber=<%=currentPage + 1%>'>下一页</a>
            <%
                }
            %>&nbsp;&nbsp;<a
                    href='?pageNumber=<%=maxPageNumber%>'>最后一页</a>&nbsp;&nbsp;
        </td>


    </tr>
</table>

<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>