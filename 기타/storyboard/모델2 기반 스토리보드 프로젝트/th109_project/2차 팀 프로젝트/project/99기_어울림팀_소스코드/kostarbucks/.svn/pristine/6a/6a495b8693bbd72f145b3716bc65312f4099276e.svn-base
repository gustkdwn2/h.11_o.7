package edu.kosta.kostarbucks.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.kostarbucks.dao.ChainDao;
import edu.kosta.kostarbucks.vo.BasicInfoVo;
import edu.kosta.kostarbucks.vo.ChainListVo;
import edu.kosta.kostarbucks.vo.SaleItemVo;

@Service
public class ChainService {
	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 체인점 목록 가져오는 서비스
	public List<ChainListVo> chainList() {
		ChainDao dao =  sqlSession.getMapper(ChainDao.class);
		List<ChainListVo> list = dao.chainList();
		return list;
	}
	
	// 체인점 상세 정보 가져오는 서비스
	public BasicInfoVo chainDetail(String chain_id) {
		ChainDao dao = sqlSession.getMapper(ChainDao.class);
		return dao.chainDetail(chain_id);
	}

	// 해당 체인점 메뉴 가져오는 서비스
	public List<SaleItemVo> saleItemDetail(String chain_id) {
		ChainDao dao = sqlSession.getMapper(ChainDao.class);
		return dao.saleItemDetail(chain_id);
	}
}
