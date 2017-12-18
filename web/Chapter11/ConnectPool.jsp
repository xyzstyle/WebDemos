<%@ page  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.DataSource,javax.naming.*"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		long startTime = System.currentTimeMillis();
		try {

			Context initCtx = new InitialContext();
			DataSource ds = (DataSource) initCtx
					.lookup("java:comp/env/jdbc/jw");
			for (int i = 0; i < 100; i++) {
				Connection conn = ds.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from student");
				while (rs.next()) {
					rs.getInt(1);
					rs.getString(2);
				}
				stmt.close();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		long t = System.currentTimeMillis() - startTime;
		out.println("<br>使用连接池技术花费的时间是" + t);
	%>
</body>
</html>