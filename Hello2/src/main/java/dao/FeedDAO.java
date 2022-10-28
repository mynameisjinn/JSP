package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;
import util.ConnectionPool;

public class FeedDAO {
	
	public boolean insert(String uid, String ucon) throws
	NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "INSERT INTO feed(id, content) VALUES(?,?)";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);
			stmt.setString(2, ucon);
			
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		}
		finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}
	public ArrayList<FeedObj> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null ;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
			while(rs.next()) {
				feeds.add(new FeedObj(rs.getString("id"),
						rs.getString("content"), rs.getString("ts")));
			}
			return feeds;
		}
		finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}

}
