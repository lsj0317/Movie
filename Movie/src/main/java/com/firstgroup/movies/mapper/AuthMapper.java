package com.firstgroup.movies.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.AuthVO;

@Mapper
public interface AuthMapper {

	void insertAuth(AuthVO authVo);
	
	void updateAuth(AuthVO authVO);
	
	void deleteAuth(String id);
}
