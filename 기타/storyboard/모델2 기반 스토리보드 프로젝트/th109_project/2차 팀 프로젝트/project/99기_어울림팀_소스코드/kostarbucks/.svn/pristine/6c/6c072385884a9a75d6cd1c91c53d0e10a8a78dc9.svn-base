package edu.kosta.kostarbucks.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.kostarbucks.dao.MemListDao;
import edu.kosta.kostarbucks.vo.MemListVo;
import edu.kosta.kostarbucks.vo.SaleListVo;

@Service
public class MemListService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 회원번호를 확인하는 서비스
	public MemListVo memNumCheck(String mem_num) {
		MemListDao dao = sqlSession.getMapper(MemListDao.class);
		return dao.memNumCheck(mem_num);
	}

	// 메일 중복 확인하는 서비스
	public MemListVo memEmailCheck(String mem_email) {
		MemListDao dao = sqlSession.getMapper(MemListDao.class);
		return dao.memEmailCheck(mem_email);
	}

	// 회원가입 서비스
	public void join(MemListVo memListVo, HttpServletRequest request) {
		String mem_num = request.getParameter("mem_num1") + "-" + request.getParameter("mem_num2") + "-"
				+ request.getParameter("mem_num3") + "-" + request.getParameter("mem_num4");
		memListVo.setMem_num(mem_num);
		memListVo.setMem_pwd(request.getParameter("mem_pwd1"));
		
		MemListDao dao = sqlSession.getMapper(MemListDao.class);
		dao.join(memListVo);

	}
	// 로그인 가능 여부를 가져오는 서비스
	public int login(MemListVo memListVo,HttpSession session) {
		MemListDao dao = sqlSession.getMapper(MemListDao.class);
		MemListVo vo = dao.login(memListVo);
		if(vo==null){
			return 1;
		}else{
			session.setAttribute("loginInform", vo); // 로그인
			return 0;
		}
	}

	// 해당 회원이 구매목록 서비스
	public List<SaleListVo> mySaleList(HashMap<String, Object> map) {
		MemListDao dao = sqlSession.getMapper(MemListDao.class);
		return dao.mySaleList(map);
	}

	// 해당 회원이 구매한 RecordCount 서비스
	public int mySaleListRecord(String mem_num) {
		MemListDao dao = sqlSession.getMapper(MemListDao.class);
		return dao.mySaleListRecord(mem_num);
	}
}
