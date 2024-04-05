package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.NotiVO;
import com.firstgroup.movies.mapper.NotiMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class NotiServiceImpl implements NotiService{


	//@Setter(onMethod_ = @Autowired)
	private NotiMapper mapper;
	
	@Override
	public void register(NotiVO noti) {
		
		log.info("register........" + noti);
		mapper.insert(noti);
	}
	
	@Override
	public NotiVO get(Long bno) {
		
		log.info("get......." + bno);
		return mapper.read(bno);
	}
	
	@Override
	public boolean modify(NotiVO noti) {
		
		log.info("modify......." + noti);
		
		return mapper.update(noti) == 1;
	}
	
	@Override
	public boolean remove(Long bno) {
		
		log.info("remove...." + bno);
		
		return mapper.delete(bno) == 1;
	}
	
	
	
	/*@Override
	public List<NotiVO> getList() {

		log.info("getList........");

		return mapper.getList();

	}*/
	
	@Override
	public List<NotiVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	
}
