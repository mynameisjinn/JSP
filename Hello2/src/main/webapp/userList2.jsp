<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/mysns", "root","1111");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT id, name FROM user");
	
	String str = "<table align=center>";
	str += "<tr><th colsapn=3>가입자리스트</th></tr>";
	while(rs.next()) {
		str += "<tr><td colspan=3><hr></td></tr>";
		str += "<tr>";
		str += "<td>"+rs.getString("id")+"</td>";
		str += "<td>"+rs.getString("name")+"</td>";
		str += "<td>"+rs.getString("ts")+"</td>";
		str += "</tr>";
	}
	str += "</table>";
	out.print(str);
	rs.close(); stmt.close(); conn.close();
%>
