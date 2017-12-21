<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.xyz.tool.TimeUtil" %>
<%@ page import="com.xyz.model.ArticleTypeModel" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="CSS/style.css">
    <script language="javascript" type="text/javascript"
            src="JS/validate.js"></script>
    <title>博客天空-后台管理</title>
    <style type="text/css">
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
    </style>
</head>

<%
    List<ArticleTypeModel> list = null;//需要完成
    if (list.size() == 0) {
        out.print("<script language=javascript>alert('文章类型还没有添加，请添加！');window.location.href='back_ArticleTypeAdd.jsp';</script>");
    }
%>
<body>
<jsp:include page="/back_Top.jsp" flush="true"/>
<table width="800" border="0" align="center" cellpadding="0"
       cellspacing="0" background="images/back1.gif">
    <tr>
        <td width="227" valign="top">
            <jsp:include page="/back_Left.jsp"
                         flush="true"/>
        </td>
        <td width="573" valign="top">
            <table width="227" border="0" cellpadding="0" cellspacing="0">
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
                            out.println("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;文章添加</p>");
                        %>
                        <form name="form" method="post" action="ArticleServlet?method=3"
                              onSubmit="return addArticle()">

                            <table width="340" border="1" cellpadding="1" cellspacing="1"
                                   bordercolor="#FFFFFF" bgcolor="#FECE62">
                                <tr>
                                    <td width="77" height="30">
                                        <div align="center">文章主题：</div>
                                    </td>
                                    <td width="250" bgcolor="#FFFFFF">
                                        <div align="center">
                                            <input name="title" type="text" class="inputinput" size="30">
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td height="30">
                                        <div align="center">文章类别：</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <div align="center">

                                            <select name="typeId" class="inputinput">
                                                <%
                                                    for (int i = 0; i < list.size(); i++) {
                                                        ArticleTypeModel model = list.get(i);
                                                %>
                                                <option value="<%=model.getId()%>"><%=model.getTypeName()%>
                                                </option>
                                                <%
                                                    }
                                                %>
                                            </select>


                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td height="30">
                                        <div align="center">文章内容：</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <div align="center">
												<textarea name="content" cols="28" rows="20"
                                                          class="inputinput"></textarea>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <div align="center">发布时间：</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <div align="center">
                                            <input name="phTime" type="text" class="inputinput"
                                                   value="<%=TimeUtil.currentlyTime()%>" size="30"
                                                   readonly="readonly" onclick="alert('此文本框已设为只读，用户不能修改')">
                                        </div>
                                    </td>
                                </tr>


                                <tr>
                                    <td height="30">
                                        <div align="center">访问次数：</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <div align="center">
                                            <input name="number" type="text" class="inputinput"
                                                   value="0" size="30" readonly="readonly"
                                                   onclick="alert('此文本框已设为只读，用户不能修改')">
                                        </div>
                                    </td>
                                </tr>


                            </table>
                            <br> <input type="image" class="inputinputinput"
                                        src="images/save.gif"> &nbsp;&nbsp; <a href="#"
                                                                               onClick="javascript:form.reset()"><img
                                src="images/reset.gif"> </a>
                        </form>
                        <%
                            if (request.getAttribute("result") != null) {
                                out.print(request.getAttribute("result"));
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
            </table>
        </td>
    </tr>
</table>
<jsp:include page="/back_Down.jsp" flush="true"/>
</body>
</html>