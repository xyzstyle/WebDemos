<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xyz.model.ArticleTypeModel"%>
<%@ page import="com.xyz.tool.PaginationHelper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<script language="javascript" type="text/javascript"
	src="JS/validate.js"></script>
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

<script type="text/javascript">
	function deleteForm(id) {
		if (confirm("确定要删除此类别信息吗？")) {
			window.location.href = "ArticleServlet?method=2&id=" + id;
		}
	}
</script>

</head>
<jsp:useBean id="articleTypeDao" class="com.xyz.dao.ArticleTypeDao"
	scope="page"></jsp:useBean>

<%
	String pageNumber = request.getParameter("pageNumber");
	List<ArticleTypeModel> myList = null;
	PaginationHelper<ArticleTypeModel> helper = null;
	if (pageNumber == null) {
		List<ArticleTypeModel> list = articleTypeDao.queryArticleType();
		helper = new PaginationHelper<ArticleTypeModel>(list, 3);
		session.setAttribute("paginationArticleType", helper);
		myList = helper.getSpecifiedPage(1);
	} else {
		helper = (PaginationHelper<ArticleTypeModel>) session
				.getAttribute("paginationArticleType");

		myList = helper.getSpecifiedPage(Integer.parseInt(request
				.getParameter("pageNumber")));

	}
%>

<body>
	<jsp:include page="back_Top.jsp" flush="true" />
	<table width="800" border="0" align="center" cellpadding="0"
		cellspacing="0" background="images/back1.gif">
		<tr>
			<td width="227" valign="top"><jsp:include page="back_Left.jsp"
					flush="true" /></td>
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
								if (helper.getCount_Total() <= 0) {
									out.println("<p align=center><img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;&nbsp;&nbsp;没有文章类别！</p>");
							%>
							<table width="399" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td><div align="right">
											<a href="back_ArticleTypeAdd.jsp">添加</a>
										</div></td>
								</tr>
							</table> <%
 	} else {

 		out.print("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;文章类别查询</p>");
 %>
							<table width="486" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td><div align="right">
											<a href="back_ArticleTypeAdd.jsp">添加</a>
										</div></td>
								</tr>
							</table>
							<table width="486" border="1" cellpadding="1" cellspacing="1"
								bordercolor="#FFFFFF" bgcolor="#FECE62">
								<tr>
									<td width="133" height="20"><div align="center">类别名称</div></td>
									<td width="209"><div align="center">类别描述</div></td>
									<td width="126"><div align="center">操作</div></td>
								</tr>

								<%
									for (int i = 0; i < myList.size(); i++) {
											ArticleTypeModel articleTypeModel = (ArticleTypeModel) myList
													.get(i);
								%>
								<tr bgcolor="#FFFFFF">
									<td height="20"><div align="center"><%=articleTypeModel.getTypeName()%></div></td>
									<td><div align="center"><%=articleTypeModel.getDescription()%></div></td>
									<td><div align="center">
											<a
												href="javascript:deleteForm('<%=articleTypeModel.getId()%>')">删除</a>
										</div></td>
								</tr>
								<%
									}
								%>
							</table> <%=helper.printCtrl()%> <%
 	}
 %>



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
	<jsp:include page="back_Down.jsp" flush="true" />
</body>
</html>