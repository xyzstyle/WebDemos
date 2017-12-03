<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/27
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    final String SEPARATOR =".";
    int count=0;
    int add(int a,int b) {
        return a+b;
    }
%>

<%= "count="+(++count)+SEPARATOR%>

</body>
</html>
