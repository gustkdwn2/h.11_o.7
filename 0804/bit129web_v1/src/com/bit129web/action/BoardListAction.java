package com.bit129web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit129web.model.board.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO boarddao = new BoardDAO();
		List boardlist = new ArrayList();
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null ) {
			page = Integer.parseInt("page");
		}
		
		int listcount = boarddao.getListCount();
		boardList = boarddao.getBoardList(page, limit);
		
		return null;
	}

}
