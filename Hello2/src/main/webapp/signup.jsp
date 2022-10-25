<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");
	
	UserDAO dao = new UserDAO();
	if (dao.exists(uid)){
		out.print("이미 가입한 회원입니다.");
		return;
	}
	if (dao.insert(uid, upass, uname)) {
		out.print("회원가입이 완료되었습니다.");
	}
	else{
		out.print("회원가입 처리 중 오류가 발생하였습니다.");
	}
%>	