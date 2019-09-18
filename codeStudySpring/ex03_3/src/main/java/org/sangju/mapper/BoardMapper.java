package org.sangju.mapper;

import java.util.List;

import org.sangju.domain.BoardVO;
import org.sangju.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);

	public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board);

	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);
}
