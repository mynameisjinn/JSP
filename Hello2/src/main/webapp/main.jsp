<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
	String uid = (String) session.getAttribute("id");
	if (uid == null){
		response.sendRedirect("login.html");
		return;
	}
	session.setAttribute("id",uid);
	
	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
		
	String str = "<table align = center>";
	str += "<tr height=40><td><b>작성글 리스트</b></td>";
	str += "<td align=rigth>";
	str += "<a href='feedAdd.html'><button>글쓰기</button></a>";
	str += "</td></tr>";
	
	for (FeedObj feed : feeds){
		str += "<tr><td colspan=2><hr></td></tr>";
		str += "<tr>";
		str += "<td><samll>" + feed.getId() + "</small></td>";
		str += "<td><samll>&nbsp;(" + feed.getTs() + ")</small></td>";
		str += "</tr>";
		str += "<tr><td colspan=2>" + feed.getContent() +"</td></tr>";
	}
	str += "</table>";
	out.print(str);
%>
