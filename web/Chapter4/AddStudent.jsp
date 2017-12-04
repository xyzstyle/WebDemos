<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%  
   String driver = "com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
   String user = "root"; 
   String password = "123456";
   try { 
      Class.forName(driver);
      Connection conn = DriverManager.getConnection(url, user, password);
      if(!conn.isClosed()) 
      System.out.println("Succeeded connecting to the Database!");
						Statement stmt=conn.createStatement();
      request.setCharacterEncoding("utf-8");
      String name=request.getParameter("name");
      String stupassword=request.getParameter("password");
      String address=request.getParameter("address");
      String sql="insert into student(name,password,address) values('"+name+"','"+password+"','"+address+"')";//插入记录的SQL语句
      stmt.executeUpdate(sql);//执行更新

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
</head>

<body>
<p align="center">您输入的信息为：</p>
<p align="center">你的姓名：<%=name%></p>
<p align="center">你的密码：<%=password%></p>
<p align="center">您的地址：<%=address%></p>
<p align="center">你的信息已经成功存入数据库中</p>
<p><a href="ListStudent.jsp">显示JSPUser中所有记录</a></p>
<%  
      stmt.close();
      conn.close();
  }catch(Exception ex){
       out.println(ex.getMessage());
  }
  %>
</p>
</body>
</html>