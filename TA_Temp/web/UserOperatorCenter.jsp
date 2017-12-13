<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/5
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="CheckPermission.jsp" %>
<jsp:useBean id="dao" class="dao.StudentDao"/>
<jsp:useBean id="student" class="model.StudentModel"/>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:setProperty name="student" property="*"/>
<html>
<head>
    <title>Insert title here</title>
</head>
<body>
<%

    int method = Integer.parseInt(request.getParameter("method"));
    String result = "";
    switch (method) {
        case 1: {
            if (dao.operateStudent(method, student)) {
                result = "添加用户成功!";
            } else {
                result = "添加用户失败!";
            }
            RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
            request.setAttribute("result", result);
            rd.forward(request, response);
        }
        break;
        case 2: {
            if (dao.operateStudent(method, student)) {
                out.print("<script language=javascript>alert('修改成功！');window.location.href='ListStudent.jsp';</script>");
            } else {
                out.print("<script language=javascript>alert('修改失败！');history.go(-1);</script>");
            }

        }
        break;
        case 3:
            if (dao.operateStudent(method, student)) {
                out.print("<script language=javascript>alert('删除成功！');window.location.href='ListStudent.jsp';</script>");
            } else {
                out.print("<script language=javascript>alert('删除失败！');history.go(-1);</script>");
            }
            break;
    }
%>
</body>
</html>