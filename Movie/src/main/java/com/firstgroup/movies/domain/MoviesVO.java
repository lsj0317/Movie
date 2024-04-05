package com.firstgroup.movies.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MoviesVO {

	private Long movBno;			// 영화 식별번호
	private String title;			// 영화 제목
	private String content;			// 영화 설명
	private double starsAvg;		// 평균별점
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date createdDate;		// 영화 개봉일
	private Date regDate;			// 게시물 작성일
	private Date update;			// 게시물 업데이트 일자
	private int recommend;			// 추천수
	private Long  movImgNo;			// 영화 포스터 식별번호

    private List<String> major;
	private List<String> genre;
	private List<String> actorList;
	private List<String> directorList;
	private List<MoviesCommentVO> comment;
	
	private String video;
	
	private String actor; 	//배우 배열 파싱용
	private List<ActorVO> actList;	//배우 배열
	
	private String director;	//감독 배열 파싱용
	private List<DirectorVO> dirList;//감독 배열
	
	private List<ImgVO> titleList;		//영화 핵심 장면(왓챠피디아 최상단 이미지)
	private List<ImgVO> imgList;		//영화 포스터
	private List<ImgVO> contentList;	//영화 주요 장면(줄거리)
	
}
