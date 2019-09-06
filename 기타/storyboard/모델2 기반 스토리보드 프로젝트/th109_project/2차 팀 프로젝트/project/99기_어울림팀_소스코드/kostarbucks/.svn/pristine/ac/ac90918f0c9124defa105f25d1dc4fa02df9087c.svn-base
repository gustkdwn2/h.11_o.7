package edu.kosta.kostarbucks.dao;

import java.util.List;

import edu.kosta.kostarbucks.vo.BasicInfoVo;
import edu.kosta.kostarbucks.vo.ChainListVo;
import edu.kosta.kostarbucks.vo.GiftCardVo;
import edu.kosta.kostarbucks.vo.SaleItemVo;

public interface ChainDao {

	// 체인점 목록
	List<ChainListVo> chainList();

	// 체인점 상세 정보
	BasicInfoVo chainDetail(String chain_name);

	// 해당 체인점 메뉴
	List<SaleItemVo> saleItemDetail(String chain_id);

	// 발생한 난수가 상품권 테이블에 있는지 검색
	GiftCardVo cardkey(String key);

	// 상품권테이블에 난수 등록
	void createkey(String key);
}
