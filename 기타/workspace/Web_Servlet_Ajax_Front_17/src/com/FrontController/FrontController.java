package com.FrontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action.Action;
import com.Action.ActionForward;
import com.Action.IdCheckServletAction;



@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FrontController() {
        super();
       
    }
    private void Process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String ContextPath = request.getContextPath();

		String Command = RequestURI.substring(ContextPath.length());

		System.out.println("RequestURI : " + RequestURI);
		System.out.println("ContextPath : " + ContextPath);
		System.out.println("Command : " + Command);

		
		ActionForward forward = null;
		Action action = null;

		if (Command.equals("/IdCheckAction.do")) {
			System.out.println("IdCheckAction Display");
			action = new IdCheckServletAction(); 
			try {
				forward = action.execute(request, response);
			
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (Command.equals("/BoardWrite.do")) {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("qna_board_write.jsp");

		}
		if (forward != null) {
			if (forward.isRedirect()) { // true (isRedirect)
				System.out.println("forward.isRedirect : "
						+ forward.isRedirect());
				
				response.sendRedirect(forward.getPath());
			} else {
				System.out.println("forward.getPath() : " + forward.getPath());
				RequestDispatcher dispatcher = request
						.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		// TODO Auto-generated method stub
		Process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request,response);
	}

}
