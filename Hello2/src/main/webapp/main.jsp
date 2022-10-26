<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.*" %>
<%
	String sql = "SELECT * FROM feed ORDER BY ts DESC";
	
	Connection conn = ConnectionPool.get();
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	
	String str = "<table align = center>";
	str += "<tr><th colspan=2>작성글 리스트</th></tr>";
	while(rs.next()){
		str += "<tr><td colspan=2><hr></td></tr>";
		str += "<tr>";
		str += "<td><samll>" + rs.getString("id") + "</small></td>";
		str += "<td><samll>&nbsp;(" + rs.getString("ts") + ")</small></td>";
		str += "</tr>";
		str += "<tr><td colspan=2>" + rs.getString("content") +"</td></tr>";
	}
	str += "</table>";
	out.print(str);
	
	rs.close(); stmt.close(); conn.close();