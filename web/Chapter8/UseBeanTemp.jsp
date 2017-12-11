<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="circle"  class="com.xyz.Circle"  />
<jsp:setProperty name="circle" property="radius" value="20"/>
半径：<jsp:getProperty name="circle" property="radius"/>
<br/>
<%


    out.print("Length:"+circle.getCircleLength());
    out.println("<br/>");
    out.println("Area:"+circle.getCircleArea());
%>
</body>
</html>
