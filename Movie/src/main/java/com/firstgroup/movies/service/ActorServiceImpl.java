package com.firstgroup.movies.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.ActorVO;
import com.firstgroup.movies.mapper.ActorMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class ActorServiceImpl implements ActorService {
	
	@Setter(onMethod_ = @Autowired)
	private ActorMapper actorMapper;

	@Override
	public ActorVO getActor(Long actbno) {
		log.info("불러올 배우 번호 : " + actbno);
		
		return actorMapper.getActor(actbno);
	}

	@Override
	public List<ActorVO> actorList() {
		log.info("배우 목록 전체 출력...........");
		
		return actorMapper.getActorList();
	}

	@Override
	public void insertActor(ActorVO atv) {
		
		log.info("배우 등록...........");
		log.info("배우 정보 : "+atv);
		
		actorMapper.insertActor(atv);
	}

	@Override
	public int modify(ActorVO atv) {
		log.info("수정할 배우 번호 : " + atv);
		
		return actorMapper.modify(atv);
	}

	@Override
	public int remove(Long actbno) {
		log.info("삭제할 배우 번호 : " + actbno);
		
		ActorVO vo = actorMapper.getActor(actbno);
		
		return actorMapper.remove(actbno);
	}
	
	
	
}