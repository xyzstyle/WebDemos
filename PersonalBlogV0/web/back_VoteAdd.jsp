<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>

    <link type="text/css" rel="stylesheet" href="CSS/style.css">
    <script language="javascript" type="text/javascript"
            src="JS/validate.js"></script>
    <title>博客天空-后台管理</title>

</head>
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

                        <p align=left>
                            &nbsp;&nbsp;&nbsp;&nbsp;<img src=images/icon.gif width=10
                                                         height=10>&nbsp;&nbsp;投票内容添加
                        </p>

                        <form name="form" method="post"
                              action="back_VoteOperator.jsp?method=0"
                              onsubmit="voteAdd() ">

                            <table width="340" border="1" cellpadding="1" cellspacing="1"
                                   bordercolor="#FFFFFF" bgcolor="#FECE62">
                                <tr>
                                    <td width="77" height="30">
                                        <div align="center">投票内容：</div>
                                    </td>
                                    <td width="250" bgcolor="#FFFFFF">
                                        <div align="center">
                                            <input name="voteName" type="text" class="inputinput"
                                                   size="30">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        <div align="center">票数：</div>
                                    </td>
                                    <td bgcolor="#FFFFFF">
                                        <div align="center">0</div>
                                    </td>
                                </tr>
                            </table>
                            <br> <input type="image" class="inputinputinput"
                                        src="images/save.gif"> &nbsp;&nbsp; <a href="#"
                                                                               onClick="javascript:form.reset()"><img
                                src="images/reset.gif"></a>
                        </form>
                        <%
                            //显示新增是否成功
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