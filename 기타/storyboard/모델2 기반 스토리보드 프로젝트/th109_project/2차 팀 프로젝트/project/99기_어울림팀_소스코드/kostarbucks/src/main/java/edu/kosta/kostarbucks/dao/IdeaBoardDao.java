package edu.kosta.kostarbucks.dao;

import java.util.HashMap;
import java.util.List;

import edu.kosta.kostarbucks.vo.IdeaBoardVo;

public interface IdeaBoardDao {

	// 아이디어게시판 RecordCount
	int ideaBoardRecord();

	// 아이디어게시판 공지사항
	IdeaBoardVo ideaNotice();

	// 아이디어게시판 일반게시글
	List<IdeaBoardVo> ideaList(HashMap<String, Object> map);

	// 아이디어게시판 상세보기
	IdeaBoardVo ideaDetail(int idea_num);

	// 아이디어게시판 조회수 증가
	void ideaReadCount(int idea_num);

	// 아이디어게시판 글쓰기
	void ideaWrite(IdeaBoardVo ideaBoardVo);
	
	// 아이디어게시판 수정
	void ideaUpdate(IdeaBoardVo ideaBoardVo);

	// 아이디어게시판 게시글 삭제
	void ideaDelete(String idea_num);

	// 아이디어 게시판의 상태를 채택으로 변경
	void stateUpdate(String idea_num);

}
