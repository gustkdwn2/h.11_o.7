package org.sangju.service;

import java.util.List;

import org.sangju.domain.Criteria;
import org.sangju.domain.ReplyPageDTO;
import org.sangju.domain.ReplyVO;
import org.sangju.mapper.BoardMapper;
import org.sangju.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardmapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register........" + vo);
		boardmapper.updateReplyCnt(vo.getBno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove......" + rno);
		ReplyVO vo = mapper.read(rno);
		boardmapper.updateReplyCnt(vo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(
			mapper.getCountByBno(bno),
			mapper.getListWithPaging(cri, bno)
		);
	}

}
