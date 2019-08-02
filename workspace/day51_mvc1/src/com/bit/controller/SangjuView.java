package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sangju")
public class SangjuView extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		Object name = "현상주";
		Object adress = "서울 노원구";
		Object number = "010-7728-169X";
		
		request.setAttribute("name", name);
		request.setAttribute("adress", adress);
		request.setAttribute("number", number);

		RequestDispatcher d = request.getRequestDispatcher("/view/sangjuView.jsp");
		d.forward(request, response);
	}

}
