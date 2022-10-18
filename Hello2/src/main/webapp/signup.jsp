<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");
	
	//String  sql = "INSERT INTO user(id,password, name) VALUES";
	//sql += "('"+uid+"', '"+upass+"','"+uname+"')";
	String sql = "INSERT INTO user(id, password, name)VALUES(?, ?, ?)";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/mysns","root","1111");
	//Statement stmt = conn.createStatement();
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	stmt.setString(2, upass);
	stmt.setString(3, uname);
	
//	int count = stmt.executeUpdate(sql);
	int count = stmt.executeUpdate();
	if (count == 1){
		out.print("회원가입이 완료되었습니다.");
	}
	else {
		out.print("회원가입 중 오류가 발생하였습니다.");
	}
	stmt.close(); conn.close();
%>
	