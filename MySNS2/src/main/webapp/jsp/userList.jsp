<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%
	out.print((new UserDAO()).getList());
%>
