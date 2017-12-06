<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<script language="javascript" type="text/javascript"
	src="JS/validate.js"></script>
<script type="text/javascript">
	function deleteForm(id) {
		if (confirm("确定要删除此投票信息吗？")) {
			window.location.href = "back_VoteOperator.jsp?method=1&"+"id=" + id;
		}
	}
</script>
<title>博客天空-后台管理</title>
<style type="text/css">
<!--
.style1 {
	color: #FFCD00
}

.style2 {
	color: #a54400;
	font-weight: bold;
}

body {
	background-color: #F0F0F0;
}

.style4 {
	color: #666666
}
-->
</style>
</head>
<body>
	<%
		final String url = "jdbc:mysql://127.0.0.1:3306/db_blog";
		final String userName = "root";
		final String password = "123456";
		Connection con;
		try {
			Class.forName("com.mysql.jdbc.Driver")
					.newInstance();
			con = DriverManager.getConnection(url, userName, password);
	%>


	<jsp:include page="back_Top.jsp" />
	<table width="800" border="0" align="center" cellpadding="0"
		cellspacing="0" background="images/back1.gif">
		<tr>
			<td width="227" valign="top"><jsp:include page="back_Left.jsp" /></td>
			<td width="573" valign="top"><table width="227" border="0"
					cellpadding="0" cellspacing="0">
					<tr>
						<td><img src="images/back_noword_03.jpg" width="573"
							height="25"></td>
					</tr>
				</table>
				<table width="573" border="0" cellpadding="0" cellspacing="0"
					background="images/back_noword_05.jpg">
					<tr>
						<td valign="top" align="center">
							<%
								Statement stmt = con.createStatement();
									ResultSet rs = stmt.executeQuery("select * from tb_vote");
							%>

							<table border="1" cellpadding="1" cellspacing="1"
								bordercolor="#FFFFFF" bgcolor="#FECE62">
								<tr bgcolor="#FECE62">
									<td width="50" height="20"><div align="center">编号</div></td>
									<td width="100"><div align="center">投票内容</div></td>
									<td width="100"><div align="center">票数</div></td>
									<td width="80"><div align="center">操作</div></td>
								</tr>
								<%
									while (rs.next()) {
											int vId = rs.getInt(1);
								%>
								<tr bgcolor="#FFFFFF">
									<td height="20"><div align="center"><%=vId%></div></td>
									<td><div align="center"><%=rs.getString(2)%></div></td>
									<td><div align="center"><%=rs.getInt(3)%></div></td>
									<td><div align="center">
											<a href="javascript:deleteForm('<%=vId%>')">删除</a>
										</div></td>
								</tr>
								<%
									}
									} catch (Exception ex) {

										ex.printStackTrace();
									}
								%>
							</table>

						</td>
					</tr>
				</table>
				<table width="227" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td><img src="images/back_noword_18.jpg" width="573"
							height="21"></td>
					</tr>
				</table></td>
		</tr>
	</table>

	<jsp:include page="back_Down.jsp" />
</body>
</html>