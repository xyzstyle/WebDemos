<%--
  Created by IntelliJ IDEA.
  User: xyz
  Date: 2017/11/24
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.Random" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String sub = request.getParameter("Submit");
    int num = 0;
    if (sub == null) {
        Random r = new Random();
        num = r.nextInt(1000);
        session.setAttribute("num", "" + num);
    } else {
        String snum = (String) session.getAttribute("num");
        num = Integer.parseInt(snum);
        String smynum = (String) request.getParameter("number");
        if (smynum == null || smynum.trim().equals("")) {
            out.println("你还没有输入数字呢");
        } else {
            int mynum = Integer.parseInt(smynum);
            if (mynum < num)
                out.println("你输入的数字是" + mynum + "，这个数字偏小");
            else if (mynum == num)
                out.println("你输入的数字是" + mynum + "，恭喜你答对了");
            else
                out.println("你输入的数字是" + mynum + "，这个数字偏大");
        }
    }
%>
<form id="form1" name="form1" method="post" action="number.jsp">
    <label>输入你的数字：
        <input name="number" type="text" id="number"/>
    </label>
    <label>
        <input type="submit" name="Submit" value="提交"/>
    </label>
</form>

</body>
</html>
