<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<a href="http://localhost:8080/Chapter3/getUrl.jsp?id=11&name=张晶晶">link</a>

<%
    //String stuName = "凯迪克";
    //String s = URLEncoder.encode(stuName,"utf-8");
    //String url="http://localhost:8080/Chapter3/getUrl.jsp?id=11&name="+s;

    //response.sendRedirect(url);
%>
<!--<a href="">link</a>-->
</body>
</html>