<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>添加学生</title>
</head>
<body>
	<p align="center">新增学生个人信息数据</p>
	<form id="form1" name="form1" method="post"
		action="stu.do?method=1">
		<table align="center" width="260" border="0">
			<tr>
				<th width="64" scope="row">姓名：</th>
				<td width="120"><input type="text" name="name" id="textfield1" />
				</td>
			</tr>
			<tr>
				<th scope="row">密码：</th>
				<td><input type="password" name="password" id="textfield2" /></td>
			</tr>
			<tr>
				<th scope="row">地址：</th>
				<td><input type="text" name="address" id="textfield3" /></td>
			</tr>
			<tr>

				<td colspan="2" align="center"><input type="reset"
					name="button" id="button" value="重置" /> &nbsp;&nbsp;&nbsp;&nbsp; <input
					type="submit" name="button2" id="button2" value="提交" /></td>
			</tr>
		</table>
		<%
			if (request.getAttribute("result") != null) {
				out.print(request.getAttribute("result"));
			}
		%>
	</form>
	<p>&nbsp;</p>

</body>
</html>