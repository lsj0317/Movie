package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MoviesCommentVO;

public interface MoviesCommentMapper {
	
	public MoviesCommentVO getComment(Long combno);

	/* public List<MoviesCommentVO> commentList(Long movbno); */
	
	public List<MoviesCommentVO> getCommentList(Long movbno);
	
	//댓글 등록
	public int insertComment(MoviesCommentVO vo);
	
	// 댓글 삭제처리
	public int removeComment(Long combno);
	
	// 댓글리스트 페이징 처리
	public List<MoviesCommentVO> getListWithPage
								(@Param("cri") Criteria cri,
								 @Param("movbno") Long movbno);
	
	public List<MoviesCommentVO> bestComment(Long movbno);
	
	// 댓글 수정
	public int modifyComment(MoviesCommentVO vo);
}
