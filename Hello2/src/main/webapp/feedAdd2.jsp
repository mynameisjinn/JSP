<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%
	String uid = null, ucon = null, ufname = null;
	byte[] ufile null;
	
	request.serCharacterEncoding("utf-8");
	
	ServletFileUpload sfu = new ServletFileUpload(new 
								DiskFileItemFactory());
	List items = sfu.parseRequest(request);
	
	Iterator iter = items.iterator();
	while(iter.hasNext()){
		FileItem item = (FileItem) iter.next();
		String name = item.getFileName();
		if(item.isFormField()){
			String value = item.getStirng("utf-8");
			if(name.equals("content")) ucon = value;
		}
		else{
			if (name.equals("image")){
				ufname = item.getName();
				ufile = item.get();
			}
		}
	}
%>							