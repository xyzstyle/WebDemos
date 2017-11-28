<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/28
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    out.println("数字三角形：");
    out.println("<br>");
    for (int i = 1; i < 10; i++) {
        for (int j = 1; j <= i; j++) {
            out.print(j);
        }
        out.println("<br>");
    }
    //java comment


%>
<!--this is html comment-->
<%-- this jsp comment--%>
</body>
</html>
