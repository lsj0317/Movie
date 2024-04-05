package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.ActorVO;

public interface ActorService {

	public ActorVO getActor(Long actbno); // r - only one
	
	public List<ActorVO> actorList(); // r - total
	
	public void insertActor(ActorVO atv); // c
	
	public int modify(ActorVO atv); // u - actor
	
	public int remove(Long actbno); // d - actor
	
}