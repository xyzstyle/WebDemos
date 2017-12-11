<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/12/11
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Circle JavaBean</title>

</head>
<body>
<jsp:useBean id="circle" class="com.xyz.Circle" />
<!--通过上述JSP标签，获得了一个作用域为page的Circle对象-->
<%
    //利用Java语句设置圆的半径
    circle.setRadius(10);

%>
<!-- 显示圆的半径-->
<span style="font-size: x-large">圆的半径：<%=circle.getRadius()%>

</span><br>
<%--显示圆的周长 --%>
<span style="font-size: x-large">圆的周长：<%=circle.getCircleLength()%>
</span><br>
<%--显示圆的面积--%>
<span style="font-size: x-large">圆的面积：<%=circle.getCircleArea()%>
</span>

</body>
</html>
