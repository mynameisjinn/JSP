<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.*" %>
<%@ page import="dao.FeedDAO" %>

<%
	ResultSet rs = (new FeedDAO()).getList();
		
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
	
	rs.close(); 
%>