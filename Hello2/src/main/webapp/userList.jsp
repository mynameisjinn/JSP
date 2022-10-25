<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%
	
	Connection conn = ConnectionPool.get();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT id, name FROM user");
	
	String str = "";
	while(rs.next()) {
		str += rs.getString("id")+","+rs.getString("name")+"<br>";
	}
	out.print(str);
	rs.close(); stmt.close(); conn.close();
%>
