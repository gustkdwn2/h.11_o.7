package edu.kosta.kostarbucks.dao;

import java.util.HashMap;
import java.util.List;

import edu.kosta.kostarbucks.vo.MemListVo;
import edu.kosta.kostarbucks.vo.SaleListVo;

public interface MemListDao {

	// 회원번호를 확인
	MemListVo memNumCheck(String mem_num);

	// 메일 중복 확인
	MemListVo memEmailCheck(String mem_email);

	// 회원가입
	void join(MemListVo memListVo);

	// 로그인
	MemListVo login(MemListVo memListVo);

	// 해당 회원이 구매목록
	List<SaleListVo> mySaleList(HashMap<String, Object> map);

	// 해당 회원이 구매한 RecordCount
	int mySaleListRecord(String mem_num);

	// 해당 회원의 메일 검색
	MemListVo findEmail(String mem_name);

}
