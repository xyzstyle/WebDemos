<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		long startTime = System.currentTimeMillis();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/db_jw";
			for (int i = 0; i < 100; i++) {

				Connection conn1 = DriverManager.getConnection(url, "root",
						"123456");
				Statement stmt1 = conn1.createStatement();
				ResultSet rs1 = stmt1.executeQuery("select * from student");
				while (rs1.next()) {
					rs1.getInt(1);
                    rs1.getString(2);
				}
				stmt1.close();
				conn1.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		long t = System.currentTimeMillis() - startTime;
		out.println("<br>使用普通方式花费的时间是" + t);
	%>


</body>
</html>