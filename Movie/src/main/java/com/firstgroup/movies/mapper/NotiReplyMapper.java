package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.NotiReplyVO;

public interface NotiReplyMapper {

	public int insert(NotiReplyVO vo);
	
	public NotiReplyVO read(Long bno);
	
	public int delete (Long rno);
	
	public int update(NotiReplyVO reply);
	
	public List<NotiReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);//댓글의 겟수 파악
	
	
}
