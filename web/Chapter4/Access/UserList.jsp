<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<%

try   
{   
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); //加载JDBC-ODBC桥驱动程序
Connection conn=DriverManager.getConnection("jdbc:odbc:myaccess","","");  
Statement stmt=conn.createStatement(); 
String sql="select * from JSPUser";
ResultSet rs=stmt.executeQuery(sql);
%>

</head>

<body>
<table width="660" height="48" border="1" align="center" cellpadding="0" bordercolorlight="#000000" cellspacing="2" bordercolor="#FFFFFF">
  <tr bgcolor="#CCFF66">
    <th><div align="center">ID编号</div></th>
    <th><div align="center">用户名</div></th>
    <th><div align="center">密码</div></th>
    <th><div align="center">地址</div></th>
  </tr>
  <%while(rs.next()){%>
  <tr bgcolor="#CCcF90">
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    </tr>
  <%}
   rs.close();
  stmt.close();
  conn.close();
  }catch(Exception ex){
       out.println(ex.getMessage());
  }
  %>
</table>
</body>
</html>