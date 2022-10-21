<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String sql = "DELETE FROM user WHERE uid = ?";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/mysns","root","1111");
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1,uid);
	
	int count = stmt.executeUpdate();
	if (count == 1){
		out.print("회원탈퇴가 완료되었습니다.");
	}
	else{
		out.print("회원탈퇴 중 오류가 발생하였습니다.");
	}
	stmt.close(); conn.close();
%>
