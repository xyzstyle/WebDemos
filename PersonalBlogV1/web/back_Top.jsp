<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript" src="JS/onclock.js"></script>
<body  onLoad="clockon(bgclock)">
	<table width="800" height="65" border="0" align="center"
		cellpadding="0" cellspacing="0" background="images/back_noword_01.jpg">
		<tr>
			<td width="501">&nbsp;</td>
			<td width="299"><p>&nbsp;</p>
				<p>
					<a href="head_main.jsp" class="backTop">我的首页</a>&nbsp;<font
						color="#FFFFFF">|</font>&nbsp; <a href="backMainPage.jsp"
						class="backTop">管理博客</a>&nbsp;<font color="#FFFFFF">|</font>&nbsp;
					<a href="dealwith.jsp?sign=2"  class="backTop">安全退出</a>
				</p></td>
		</tr>
	</table>

	<table width="800" height="29" border="0" align="center"
		cellpadding="0" cellspacing="0"
		background="images/back_noword_011.jpg">
		<tr>
			<td valign="top"><table width="379" height="23" border="0"
					cellpadding="0" cellspacing="0">
					<tr align="center">
						<td><font color="#805717"><div id="bgclock"></div></font></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
