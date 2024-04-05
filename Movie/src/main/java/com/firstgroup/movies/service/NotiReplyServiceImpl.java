package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.NotiReplyPageVO;
import com.firstgroup.movies.domain.NotiReplyVO;
import com.firstgroup.movies.mapper.NotiReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class NotiReplyServiceImpl implements NotiReplyService{
	//   우상제 공지 댓글
	@Setter(onMethod_ = @Autowired)
	private NotiReplyMapper mapper;
	
	@Override
	public int register(NotiReplyVO vo) {
		
		return mapper.insert(vo);
	}

	@Override
	public NotiReplyVO get(Long rno) {
		
		return mapper.read(rno);
	}

	@Override
	public int modify(NotiReplyVO noti) {
		
		return mapper.update(noti);
	}

	@Override
	public int remove(Long rno) {
		
		return mapper.delete(rno);
	}

	@Override
	public List<NotiReplyVO> getList(Criteria cri, Long bno) {
		
		return mapper.getListWithPaging(cri, bno);
	}
	
	@Override
	public NotiReplyPageVO getListPage(Criteria cri, Long bno) {
		// 댓글과 댓글수 정보
		
		return new NotiReplyPageVO(
			mapper.getCountByBno(bno),
			mapper.getListWithPaging(cri, bno));
	}
	
}
