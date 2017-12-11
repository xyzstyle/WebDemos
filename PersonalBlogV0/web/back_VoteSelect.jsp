<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.sql.*" %>
<html>
<head>

    <link type="text/css" rel="stylesheet" href="CSS/style.css">
    <script language="javascript" type="text/javascript"
            src="JS/validate.js"></script>
    <script type="text/javascript">
        function deleteForm(id) {
            if (confirm("确定要删除此投票信息吗？")) {
                window.location.href = "back_VoteOperator.jsp?method=1&" + "id=" + id;
            }
        }
    </script>
    <title>博客天空-后台管理</title>
    <style type="text/css">
    </style>
</head>
<body>
<%
    //连接数据库
%>


<jsp:include page="back_Top.jsp"/>
<table width="800" border="0" align="center" cellpadding="0"
       cellspacing="0" background="images/back1.gif">
    <tr>
        <td width="227" valign="top">
            <jsp:include page="back_Left.jsp"/>
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


                        <table border="1" cellpadding="0" cellspacing="0"
                               bordercolor="#666666" bgcolor="#FECE62">
                            <tr bgcolor="#FECE62">
                                <td width="50" height="20">
                                    <div align="center">编号</div>
                                </td>
                                <td width="100">
                                    <div align="center">投票内容</div>
                                </td>
                                <td width="100">
                                    <div align="center">票数</div>
                                </td>
                                <td width="80">
                                    <div align="center">操作</div>
                                </td>
                            </tr>
                            <%
                                //查询并获取记录集
                                //使用While语句获取记录字段内容并填写到相应的td中
                            %>
                            <tr bgcolor="#FFFFFF">
                                <td height="20">
                                    <div align="center"></div>
                                </td>
                                <td>
                                    <div align="center"></div>
                                </td>
                                <td>
                                    <div align="center"></div>
                                </td>
                                <td>
                                    <div align="center">
                                        <a href="javascript:deleteForm('')">删除</a>
                                    </div>
                                </td>
                            </tr>
                            <%

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
            </table>
        </td>
    </tr>
</table>

<jsp:include page="back_Down.jsp"/>
</body>
</html>