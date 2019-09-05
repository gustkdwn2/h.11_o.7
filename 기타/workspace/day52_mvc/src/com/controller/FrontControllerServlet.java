package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.EmpDTO;
import com.service.SelectService;

@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		System.out.println("requestURI : " + requestURI);
		System.out.println("contextPath : " + contextPath);
		System.out.println("command : " + command);

		if (command.equals("/insert.do")) {
			System.out.println("insert.do");
		} else if (command.equals("/delete.do")) {
			System.out.println("delete.do");
		} else if (command.equals("/update.do")) {
			System.out.println("update.do");
		} else if (command.equals("/select.do")) {
//			System.out.println("select.do");
			ArrayList<EmpDTO> list = new SelectService().execute(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
