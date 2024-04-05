package com.firstgroup.movies.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.ImgVO;

@Mapper
public interface ImgMapper {
	
	public ImgVO getImg(Map<String, Object> data);
	
	public void insert(ImgVO vo); // create
	
	public void delete(ImgVO vo); // delete
	
	public List<ImgVO> findByBno (Map<String, Object> data); // select
}
