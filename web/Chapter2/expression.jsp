<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/28
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>JSP表达式 </h1>
<b>PI 的值： </b><%=Math.PI %><br/>
<b>100,99中最大的值 :</b><%=Math.max(100, 99) %><br/>
<b>100,99中最小的值 :</b><%=Math.min(100, 99) %><br/>
<b>3+2-5的值 :</b><%=3 + 2 - 5 %><br/>
<b>(3+2)==5的值 :</b><%=(3 + 2) == 5 %><br/>
<b>(3+2)!=5的值 :</b><%=(3 + 2) != 5 %><br/>

</body>
</html>
