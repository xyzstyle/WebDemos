<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %><%--
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
    ArrayList<String> getMsg(){
        ArrayList<String> lists = new ArrayList<>();
        lists.add("abc");
        lists.add("def");
        return lists;
    }
%>

<%
    request.setAttribute("msg",getMsg());
    RequestDispatcher dispatcher=request.getRequestDispatcher("/Chapter3/third.jsp");

    dispatcher.forward(request,response);

%>
<div align='center'>




</div>

</body>
</html>
