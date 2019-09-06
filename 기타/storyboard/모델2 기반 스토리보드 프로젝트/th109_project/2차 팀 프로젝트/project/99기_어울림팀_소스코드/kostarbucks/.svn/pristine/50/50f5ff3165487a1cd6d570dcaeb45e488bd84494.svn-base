package edu.kosta.kostarbucks.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.kostarbucks.service.MemListService;
import edu.kosta.kostarbucks.vo.IdeaBoardVo;
import edu.kosta.kostarbucks.vo.MemListVo;
import edu.kosta.kostarbucks.vo.SaleListVo;

@Controller
public class MemberController {

	private MemListService memListService;
	@Autowired
	public void setMemListService(MemListService memListService) {
		this.memListService = memListService;
	}
	
	// 회원가입시 회원번호 확인하는 컨트롤러
	@RequestMapping("memNumCheck.do")
	public ModelAndView memNumCheck(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("member/memCheck");
		
		// 각각 받아온 번호를 하나로 합침
		String mem_num=request.getParameter("mem_num1")+"-"+request.getParameter("mem_num2")+"-"
				+request.getParameter("mem_num3")+"-"+request.getParameter("mem_num4");
		
		// 회원번호를 확인하는 서비스
		MemListVo vo = memListService.memNumCheck(mem_num);
		if(vo==null){
			// 없는 번호
			mav.addObject("check",1);
		}else if(vo.getMem_name()!=null){
			// 이미 가입된 회원
			mav.addObject("check",2);
		}else{
			// 회원가입 가능
			mav.addObject("check",3);
			mav.addObject("mem_num1",request.getParameter("mem_num1"));
			mav.addObject("mem_num2",request.getParameter("mem_num2"));
			mav.addObject("mem_num3",request.getParameter("mem_num3"));
			mav.addObject("mem_num4",request.getParameter("mem_num4"));
		}
		return mav;
	}
	
	// 회원가입시 메일 중복 확인하는 컨트롤러
	@RequestMapping("memEmailCheck.do")
	public ModelAndView memEmailCheck(String mem_email){
		ModelAndView mav = new ModelAndView("member/memCheck");
		
		// 메일 중복 확인하는 서비스
		MemListVo vo = memListService.memEmailCheck(mem_email);
		if(vo==null){
			// 사용가능
			mav.addObject("check",4);
			mav.addObject("mem_email",mem_email);
		}else{
			// 이메일중복
			mav.addObject("check",5);
		}
		return mav;
	}	
	
	// 회원가입하는 컨트롤러
	@RequestMapping("join.do")
	public ModelAndView join(MemListVo memListVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("redirect:");
		// 회원가입 서비스
		memListService.join(memListVo,request);
		return mav;
	}	
	
	// 로그인 컨트롤러
	@RequestMapping("login.do")
	public ModelAndView login(MemListVo memListVo, HttpSession session){
		ModelAndView mav = new ModelAndView("redirect:");
		
		// 로그인 가능 여부를 가져오는 서비스
		int result = memListService.login(memListVo,session);
		
		if(result==1){
			// 해당 회원이 없을 경우
			mav.addObject("result",1);
			mav.setViewName("../../index");
		}
		return mav;
	}
	
	// 로그아웃 컨트롤러
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView("redirect:");
		session.invalidate();
		return mav;
	}	
	
	// 메인화면으로 이동하는 컨트롤러
	@RequestMapping("index.do")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView("redirect:");
		return mav;
	}	
	
	// 마이페이지 컨트롤러
	@RequestMapping("mySaleList.do")
	public ModelAndView mySaleList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("member/mySaleList");
		
		// 페이징
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		// 해당 회원이 구매한 RecordCount 서비스
		int total = memListService.mySaleListRecord(request.getParameter("mem_num"));
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
		map.put("mem_num",request.getParameter("mem_num"));

		// 해당 회원이 구매목록 서비스
		List<SaleListVo> list = memListService.mySaleList(map);
		
		if(list.isEmpty()){
			// 구매목록이 없는 경우
			mav.addObject("message","My History 내역이 없습니다.");
		}

		mav.addObject("mySaleList",list);
		mav.addObject("pg", pg);
		mav.addObject("allPage", allPage);
		mav.addObject("block", block);
		mav.addObject("fromPage", fromPage);
		mav.addObject("toPage", toPage);
		
		return mav;
	}	
}
