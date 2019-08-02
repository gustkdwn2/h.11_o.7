<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
		response.setContentType("text/xml");
		String id = request.getParameter("id");
		String xml = "";
		if(id.equals("kingsmile")){
			xml = "<id>y</id>";
		}else{
			xml = "<id>n</id>";
		}
		out.print(xml);
%>		