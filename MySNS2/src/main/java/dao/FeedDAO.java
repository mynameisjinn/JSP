package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import util.ConnectionPool;

public class FeedDAO {

    public boolean insert(String jsonstr) throws NamingException, 
    	SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
        	synchronized(this) {
        		conn = ConnectionPool.get();
        		
        		String sql = "SELECT no FROM feed ORDER BY no DESC LIMIT 1";
        		stmt = conn.prepareStatement(sql);
        		rs = stmt.executeQuery();
        		
        		int max = (!rs.next()) ? 0 : rs.getInt("no");
        		stmt.close();
        		
        		JSONObject jsonobj = (JSONObject) (new JSONParser()).
        				parse(jsonstr);
        		jsonobj.put("no", max+1);
        		
        		sql = "INSERT INTO feed(no, id, jsonstr) VALUES(?,?,?)";
        		stmt = conn.prepareStatement(sql);
        		stmt.setInt(1, max+1);
        		stmt.setString(2, jsonobj.get("id").toString());
        		stmt.setString(3, jsonobj.toJSONString());
        		
        		int count = stmt.executeUpdate();
        		return (count == 1)?true:false;
        	}
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public ArrayList<FeedObj> getList() throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM feed ORDER BY ts DESC";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
            while(rs.next()) {
                feeds.add(new FeedObj(rs.getString("id"), rs.getString("content"), rs.getString("ts"), rs.getString("images")));
            }
            return feeds;
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
}