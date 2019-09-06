package edu.kosta.kostarbucks.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.kostarbucks.dao.IdeaBoardDao;
import edu.kosta.kostarbucks.vo.IdeaBoardVo;

@Service
public class IdeaBoardService {

	SqlSession sqlSession;
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 아이디어게시판 RecordCount 서비스
	public int ideaBoardRecord() {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		return dao.ideaBoardRecord();
	}

	// 아이디어게시판 공지사항 가져오는 서비스
	public IdeaBoardVo ideaNotice() {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		return dao.ideaNotice();
	}

	// 아이디어게시판 일반게시글 가져오는 서비스
	public List<IdeaBoardVo> ideaList(HashMap<String, Object> map) {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		return dao.ideaList(map);
	}

	// 아이디어게시판 상세보기 서비스
	public IdeaBoardVo ideaDetail(String num) {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		int idea_num = Integer.parseInt(num);
		dao.ideaReadCount(idea_num); // 조회수 증가
		return dao.ideaDetail(idea_num);
	}

	// 아이디어게시판 글쓰기 서비스
	public void ideaWrite(IdeaBoardVo ideaBoardVo) {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		dao.ideaWrite(ideaBoardVo);
	}
	
	// 아이디어게시판 해당 내용 가져오는 서비스
	public IdeaBoardVo ideaUpdateForm(String num) {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		int idea_num = Integer.parseInt(num);
		return dao.ideaDetail(idea_num);
	}

	// 아이디어게시판 수정 서비스
	public void ideaUpdate(IdeaBoardVo ideaBoardVo) {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		dao.ideaUpdate(ideaBoardVo);
	}

	// 아이디어게시판 게시글 삭제 서비스
	public void ideaDelete(String idea_num) {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		dao.ideaDelete(idea_num);
	}

	// 아이디어 게시판의 상태를 채택으로 변경하는 서비스
	public void stateUpdate(String idea_num) {
		IdeaBoardDao dao = sqlSession.getMapper(IdeaBoardDao.class);
		dao.stateUpdate(idea_num);
	}

}
