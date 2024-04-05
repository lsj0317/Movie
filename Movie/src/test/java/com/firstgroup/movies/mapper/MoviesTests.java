package com.firstgroup.movies.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.firstgroup.movies.domain.MoviesVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j2
public class MoviesTests {
	
	@Setter(onMethod_ = @Autowired)
	private MoviesMapper mapper;
	
	@Test
	public void insert() {
		
		MoviesVO vo = new MoviesVO();
		
		vo.setTitle("돌쇠와 서준");
		vo.setContent("조선시대 배경으로 돌쇠와 서준의 로맨스를 담은 BL물...");
		vo.setMovImgNo(2L);
		
		mapper.insert(vo);
		log.info("영화정보 입력 객체 : " + vo);
	}
	
	
	@Test
	public void get() {
		
		Long movbno = 2L;
		MoviesVO vo = new MoviesVO();
		
		vo = mapper.get(movbno);
		
		log.info(vo);
		
		
	}

}
