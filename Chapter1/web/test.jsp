<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/23
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html>
<head>
    <title>无标题文档</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%>
<%=request.getParameter("name") == null ? "" : "你好，" + request.getParameter("name") + "，欢迎进入JSP的世界" %>
<form id="form1" name="form1" method="post" action="test.jsp">
    <label>输入你的名字：
        <input name="name" type="text" id="name"/>
    </label>
    <label>
        <input type="submit" name="Submit" value="提交"/>
    </label>
</form>
</body>
</html>

</html>
