package com.firstgroup.movies.service;

import java.util.List;

import com.firstgroup.movies.domain.ImgVO;

public interface ImgService {
	public ImgVO get(String tblName, Long imgno);
	
	public void insert(ImgVO vo); // create
	
	public void delete(ImgVO vo); // delete
	
	public List<ImgVO>  findByBno(String tblName, Long bno); // select
	
	public List<? extends ImgVO> commentList(String tblName, Long imgno);
}
