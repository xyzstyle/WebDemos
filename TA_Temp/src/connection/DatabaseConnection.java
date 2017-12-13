package connection;

import java.sql.*;

public class DatabaseConnection {

	private final String url = "jdbc:mysql://127.0.0.1:3306/db_jw";
	private final String userName = "root";
	private final String password = "123456";
	private Connection conn = null;
	private Statement stmt = null;

	// 通过构造方法加载数据库驱动
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("数据库加载成功");
		} catch (Exception ex) {
			System.out.println("数据库加载失败");
		}
	}

	public DatabaseConnection() {
		creatConnection();
	}

	// 创建数据库连接
	public boolean creatConnection() {
		try {
			conn = DriverManager.getConnection(url, userName, password);
			conn.setAutoCommit(true);

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("create Connection Error!");
		}
		return true;
	}

	// 对数据库的增加、修改和删除的操作
	public boolean executeUpdate(String sql) {
		if (conn == null) {
			creatConnection();
		}
		try {
			stmt = conn.createStatement();
			int iCount = stmt.executeUpdate(sql);
			System.out.println("操作成功，所影响的记录数为" + String.valueOf(iCount));
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	// 对数据库的查询操作
	public ResultSet executeQuery(String sql) {
		ResultSet rs;
		try {
			if (conn == null) {
				creatConnection();
			}
			stmt = conn.createStatement();
			try {
				rs = stmt.executeQuery(sql);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				return null;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("executeQueryError!");
			return null;
		}
		return rs;
	}

	public void close() {

		try {
			if (stmt != null) {
				stmt.close();

			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
