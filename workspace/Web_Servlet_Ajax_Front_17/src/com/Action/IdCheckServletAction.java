package com.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckServletAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		/*response.setContentType("text/xml");
		String id = request.getParameter("id");
		String xml = "";
		if(id.equals("kingsmile")){
			xml = "<id>y</id>";
		}else{
			xml = "<id>n</id>";
		}*/
				
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("process.jsp");
		return forward;
	}

}
