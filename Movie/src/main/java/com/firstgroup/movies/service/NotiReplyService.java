package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.NotiReplyPageVO;
import com.firstgroup.movies.domain.NotiReplyVO;

public interface NotiReplyService {
	
	public int register(NotiReplyVO noti);
	
	public NotiReplyVO get(Long bno);
	
	public int modify(NotiReplyVO noti);
	
	public int remove(Long bno);
	
	public List<NotiReplyVO> getList(Criteria cri, Long bno);
	
	public NotiReplyPageVO getListPage(Criteria cri, Long bno);// 댓글과 댓글수 정보
	
}
