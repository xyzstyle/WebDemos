<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Teacher</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<%--生成名为teahcer的Teacher类对象--%>
<jsp:useBean id="teacher" class="com.xyz.Teacher"/>

<%--设置实例化对象的属性--%>
<jsp:setProperty name="teacher" property="*"/>

<%-- 通过getProperty指令输出教师信息--%>
姓名：
<jsp:getProperty name="teacher" property="name"/>
<br/>
年龄：
<jsp:getProperty name="teacher" property="age"/>
<br/>
性别：
<jsp:getProperty name="teacher" property="sex"/>
<br/>
职称：
<jsp:getProperty name="teacher" property="professional"/>

</body>
</html>
