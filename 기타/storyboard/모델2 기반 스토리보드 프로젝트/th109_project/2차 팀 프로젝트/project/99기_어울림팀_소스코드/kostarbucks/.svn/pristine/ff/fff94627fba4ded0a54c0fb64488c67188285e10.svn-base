package edu.kosta.kostarbucks.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.kostarbucks.service.IdeaBoardService;
import edu.kosta.kostarbucks.vo.IdeaBoardVo;

@Controller
public class IdeaController {

	IdeaBoardService ideaBoardService;
	@Autowired
	public void setIdeaBoardService(IdeaBoardService ideaBoardService) {
		this.ideaBoardService = ideaBoardService;
	}
	
	// 아이디어게시판 목록 컨트롤러
	@RequestMapping("ideaList.do")
	public ModelAndView ideaList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("idea/ideaList");
		
		// 페이징
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 15;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		// 아이디어게시판 RecordCount 서비스
		int total = ideaBoardService.ideaBoardRecord(); 
		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) {
			toPage = allPage;
		}

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);

		// 아이디어게시판 공지사항 가져오는 서비스
		IdeaBoardVo vo = ideaBoardService.ideaNotice();
		
		// 아이디어게시판 일반게시글 가져오는 서비스
		List<IdeaBoardVo> list = ideaBoardService.ideaList(map);

		mav.addObject("ideaList", list);
		mav.addObject("ideaNotice", vo);
		mav.addObject("pg", pg);
		mav.addObject("allPage", allPage);
		mav.addObject("block", block);
		mav.addObject("fromPage", fromPage);
		mav.addObject("toPage", toPage);
		
		return mav;
	}
	
	// 아이디어게시판 상세보기 컨트롤러
	@RequestMapping("ideaDetail.do")
	public ModelAndView ideaDetail(String idea_num){
		ModelAndView mav = new ModelAndView("idea/ideaDetail");
		
		// 아이디어게시판 상세보기 서비스
		IdeaBoardVo vo = ideaBoardService.ideaDetail(idea_num);
		mav.addObject("ideaDetail",vo);
		return mav;
	}
	
	// 아이디어게시판 글쓰기 jsp로 이동하는 컨트롤러
	@RequestMapping("ideaWriteForm.do")
	public ModelAndView ideaWriteForm(){
		ModelAndView mav = new ModelAndView("idea/ideaWrite");
		return mav;
	}
	
	// 아이디어게시판 글쓰기 컨트롤러
	@RequestMapping("ideaWrite.do")
	public ModelAndView ideaWrite(IdeaBoardVo ideaBoardVo){
		ModelAndView mav = new ModelAndView("redirect:ideaList.do");
		// 아이디어게시판 글쓰기 서비스
		ideaBoardService.ideaWrite(ideaBoardVo);
		return mav;
	}
	
	// 아이디어게시판 수정 jsp로 이동하는 컨트롤러
	@RequestMapping("ideaUpdateForm.do")
	public ModelAndView ideaUpdateForm(String idea_num){
		ModelAndView mav = new ModelAndView("idea/ideaUpdate");
		
		// 아이디어게시판 해당 내용 가져오는 서비스
		IdeaBoardVo vo = ideaBoardService.ideaUpdateForm(idea_num);
		mav.addObject("vo",vo);
		return mav;
	}
	
	// 아이디어게시판 수정 컨트롤러
	@RequestMapping("ideaUpdate.do")
	public ModelAndView ideaUpdate(IdeaBoardVo ideaBoardVo){
		ModelAndView mav = new ModelAndView("redirect:ideaList.do");
		// 아이디어게시판 수정 서비스
		ideaBoardService.ideaUpdate(ideaBoardVo);
		return mav;
	}
	
	// 아이디어게시판 게시글 삭제 컨트롤러
	@RequestMapping("ideaDelete.do")
	public ModelAndView ideaDelete(String idea_num){
		ModelAndView mav = new ModelAndView("redirect:ideaList.do");
		// 아이디어게시판 게시글 삭제 서비스
		ideaBoardService.ideaDelete(idea_num);
		return mav;
	}
	
}
