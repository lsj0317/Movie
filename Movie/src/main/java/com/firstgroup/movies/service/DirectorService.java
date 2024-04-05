package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.DirectorVO;

public interface DirectorService {

	public DirectorVO getDirector(Long dBno); // r - only one
	
	public List<DirectorVO> directorList(); // r - total
	
	public void insertDirector(DirectorVO vo); // c
	
	public int modify(DirectorVO vo); // u - director
	
	public  int remove(Long dirbno); // d - director
	
}
