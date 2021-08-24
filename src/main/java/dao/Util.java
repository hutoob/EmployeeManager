package dao;

import java.sql.*;

public class Util {
	private Util() {}
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/works?serverTimezone=UTC&useUnicode=true&zeroDateTimeBehavior=convertToNull&autoReconnect=true&characterEncoding=utf-8","root","1229");
	}
	public static void close(Connection conn,Statement ps,ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			}catch(SQLException s) {
				s.printStackTrace();
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			}catch(SQLException s) {
				s.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			}catch(SQLException s) {
				s.printStackTrace();
			}
		}
	}
}