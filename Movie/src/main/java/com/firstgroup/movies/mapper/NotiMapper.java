package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.NotiVO;

public interface NotiMapper {
	
	public List<NotiVO> getList();
	
	public List<NotiVO> getListWithPaging(Criteria cri);
	
	public int insert(NotiVO vo);
	
	public void insertSelectKey(NotiVO noti);
	
	public NotiVO read(Long bno);
	
	public int delete(Long rno);
	
	public int update(NotiVO reply);
	
	public int getTotalCount(Criteria cri);
	//Noti_table DB겟수 파악
	
}
