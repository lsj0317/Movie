package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.NotiVO;

public interface NotiService {

	public void register(NotiVO noti);
	
	public NotiVO get(Long bno);
	
	public boolean modify(NotiVO noti);
	
	public boolean remove(Long bno);

	//public List<NotiVO> getList();
	
	public List<NotiVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
}
