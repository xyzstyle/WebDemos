<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page
        import="com.xyz.model.ArticleModel,com.xyz.model.ArticleTypeModel" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="../../CSS/style.css">
    <script language="javascript" type="text/javascript"
            src="../../JS/validate.js"></script>
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
<%!
    private String getTypeName(List<ArticleTypeModel> list, int typeId) {
        for (ArticleTypeModel model : list) {
            if (model.getId() == typeId) {
                return model.getTypeName();
            }
        }
        return "";
    }
%>

<%

    List<ArticleModel> myList = (List<ArticleModel>) request.getAttribute("articles");
%>


<script type="text/javascript">
    function deleteForm(id) {
        if (confirm("确定要删除此文章吗？")) {
            window.location.href = "ArticleServlet?method=5&id=" + id;
        }
    }
</script>


<body>
<jsp:include page="../../back_Top.jsp" flush="true"/>
<table width="800" border="0" align="center" cellpadding="0"
       cellspacing="0" background="../../images/back1.gif">
    <tr>
        <td width="227" valign="top">
            <jsp:include page="../../back_Left.jsp"
                         flush="true"/>
        </td>
        <td width="573" valign="top">
            <table width="227" border="0"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td><img src="../../images/back_noword_03.jpg" width="573"
                             height="25"></td>
                </tr>
            </table>
            <table width="573" border="0" cellpadding="0" cellspacing="0"
                   background="../../images/back_noword_05.jpg">
                <tr>
                    <td valign="top" align="center">
                        <%
                            out.print("<p align=left>&nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10 height=10>&nbsp;&nbsp;文章查询</p>");
                        %>

                        <table width="500" border="0">
                            <tr>
                                <td>
                                    <div align="center">
                                        <%
                                            List<ArticleTypeModel> articleTypeList = (List<ArticleTypeModel>) request.getAttribute("articleTypes");
                                            for (int i = 0; i < articleTypeList.size(); i++) {
                                                ArticleTypeModel articleTypeModel = articleTypeList.get(i);
                                        %>
                                        <a
                                                href="article.do?method=0&typeId=<%=articleTypeModel.getId()%>">
                                            [<%=articleTypeModel.getTypeName()%>]
                                        </a>&nbsp;
                                        <%
                                            }
                                        %>

                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table width="486" border="1" cellpadding="1" cellspacing="1"
                               bordercolor="#FFFFFF" bgcolor="#FECE62">
                            <tr>
                                <td width="81" height="20">
                                    <div align="center">文章题目</div>
                                </td>
                                <td width="73">
                                    <div align="center">文章类别</div>
                                </td>
                                <td width="142">
                                    <div align="center">发布时间</div>
                                </td>
                                <td width="64">
                                    <div align="center">回复数量</div>
                                </td>
                                <td width="98">
                                    <div align="center">操作</div>
                                </td>
                            </tr>

                            <%
                                for (int i = 0; i < myList.size(); i++) {
                                    ArticleModel articleModel = myList.get(i);
                            %>
                            <tr bgcolor="#FFFFFF">
                                <td height="30">
                                    <div align="center">
                                        <a href="back_RestoreSelect.jsp?id=<%=articleModel.getId()%>"
                                           title="可以查看回复内容"><%=articleModel.getTitle()%>
                                        </a>

                                    </div>
                                </td>
                                <td>
                                    <div align="center"><%=getTypeName(articleTypeList, articleModel
                                            .getTypeId())%>
                                    </div>
                                </td>
                                <td>
                                    <div align="center"><%=articleModel.getPhTime()%>
                                    </div>
                                </td>
                                <td>
                                    <div align="center"><%="0"%>
                                    </div>
                                </td>
                                <td>
                                    <div align="center">
                                        <A href="back_ArticleUpdate.jsp?id=<%=articleModel.getId()%>">修改</A>&nbsp;&nbsp;<a
                                            href="javascript:deleteForm('<%=articleModel.getId()%>')">删除</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </table>


                    </td>
                </tr>
            </table>
            <table width="227" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td><img src="../../images/back_noword_18.jpg" width="573"
                             height="21"></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<jsp:include page="../../back_Down.jsp" flush="true"/>
</body>
</html>