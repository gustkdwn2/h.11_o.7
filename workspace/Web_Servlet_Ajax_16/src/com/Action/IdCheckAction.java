package com.Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/IdCheckAction.do")
public class IdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IdCheckAction() {
        super();
      
    }
    private void doProcess(HttpServletRequest request, 
    		HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml");
		String id = request.getParameter("id");
		String xml = "";
		if(id.equals("kingsmile")){
			xml = "<id>y</id>";
		}else{
			xml = "<id>n</id>";
		}
				
		PrintWriter out = response.getWriter();
		out.write(xml);
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
