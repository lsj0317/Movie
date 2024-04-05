package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.DirectorVO;

@Mapper
public interface DirectorMapper {
	public List<DirectorVO> getDirectorList(); //감독 전체 리스트
	public void insertDirector(DirectorVO dirVo); //감독 등록
	DirectorVO getDirector(Long dirbno); //감독 번호
	public int modify(DirectorVO dirVo); //감독 정보 수정
	public int remove(Long dirbno); // 감독 삭제
	

}
