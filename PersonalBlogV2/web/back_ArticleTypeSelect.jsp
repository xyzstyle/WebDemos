<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.xyz.model.ArticleTypeModel" %>

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
                window.location.href = "articleType.do?method=2&id=" + id;
            }
        }
    </script>
    <!--利用jsp:useBean标签生成Javabean：articleTypeDao -->
</head>


<%

    //利用articleTypeDao获取所有文章类型的List列表

%>

<body>
<jsp:include page="back_Top.jsp" flush="true"/>
<table width="800" border="0" align="center" cellpadding="0"
       cellspacing="0" background="images/back1.gif">
    <tr>
        <td width="227" valign="top">
            <jsp:include page="back_Left.jsp"
                         flush="true"/>
        </td>
        <td width="573" valign="top">
            <table width="227" border="0"
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
                            //如果没有文章类型，则调用下面的out.println语句

                            out.println("<p align=center><img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;&nbsp;&nbsp;没有文章类别！</p>");
                        %>
                        <table width="399" border="0" align="center" cellpadding="0"
                               cellspacing="0">
                            <tr>
                                <td>
                                    <div align="right">
                                        <a href="back_ArticleTypeAdd.jsp">添加</a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <%

                            //如果数据库中存在文章,则调用下面语句
                            out.print(
                                    "<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;文章类别查询</p>");

                        %>
                        <table width="486" border="0" align="center" cellpadding="0"
                               cellspacing="0">
                            <tr>
                                <td>
                                    <div align="right">
                                        <a href="back_ArticleTypeAdd.jsp">添加</a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table width="486" border="1" cellpadding="1" cellspacing="1"
                               bordercolor="#FFFFFF" bgcolor="#FECE62">
                            <tr>
                                <td width="133" height="20">
                                    <div align="center">类别名称</div>
                                </td>
                                <td width="209">
                                    <div align="center">类别描述</div>
                                </td>
                                <td width="126">
                                    <div align="center">操作</div>
                                </td>
                            </tr>

                            <%
                                //利用for语句输出文章类型
                            %>
                            <tr bgcolor="#FFFFFF">
                                <td height="20">
                                    <div align="center"><%%>
                                    </div>
                                </td>
                                <td>
                                    <div align="center"><%%>
                                    </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <a
                                                href="javascript:deleteForm('<%%>')">删除</a>
                                    </div>
                                </td>
                            </tr>
                            <%

                            %>
                        </table>
                        <%

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
<jsp:include page="back_Down.jsp" flush="true"/>
</body>
</html>