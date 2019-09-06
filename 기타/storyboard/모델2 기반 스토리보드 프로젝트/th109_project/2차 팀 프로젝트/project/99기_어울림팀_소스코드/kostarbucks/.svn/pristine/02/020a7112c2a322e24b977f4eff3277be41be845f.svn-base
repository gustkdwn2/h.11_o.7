package edu.kosta.kostarbucks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.kostarbucks.service.ChainService;
import edu.kosta.kostarbucks.vo.BasicInfoVo;
import edu.kosta.kostarbucks.vo.ChainListVo;
import edu.kosta.kostarbucks.vo.SaleItemVo;

@Controller
public class ChainController {
	private ChainService chainService;

	@Autowired
	public void setNoticeService(ChainService chainService) {
		this.chainService = chainService;
	}

	// 체인점 찾기 컨트롤러
	@RequestMapping("chainList.do")
	public ModelAndView listlist(ChainListVo chainListVo) {
		ModelAndView mav = new ModelAndView("chain/chainList");

		// 체인점 목록 가져오는 서비스
		List<ChainListVo> list = chainService.chainList();
		mav.addObject("list", list);

		return mav;
	}

	// 체인점 상세정보 컨트롤러
	@RequestMapping("chainDetail.do")
	public ModelAndView searchDetail(ChainListVo chainListVo) {
		ModelAndView mav = new ModelAndView("chain/chainDetail");
		
		// 체인점 상세 정보 가져오는 서비스
		BasicInfoVo vo = chainService.chainDetail(chainListVo.getChain_id());
		
		// 해당 체인점 메뉴 가져오는 서비스
		List<SaleItemVo> svo = chainService.saleItemDetail(chainListVo.getChain_id());
		
		// 다음 지도에 맞게 주소 짤라줌
		String address = vo.getAddress().split(",")[0];
		mav.addObject("basic", vo);
		mav.addObject("saleItem", svo);
		mav.addObject("chain", chainListVo);
		mav.addObject("address", address);

		return mav;

	}
}
