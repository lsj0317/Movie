package com.firstgroup.movies.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;

@Mapper
public interface MemberMapper {
	List<MemberVO> getMemList();
	void insertMember(MemberVO memVo); //회원가입
	
	MemberVO getMember(String id);//회원 정보 가져오기
	void updateMember(MemberVO memVo); //회원정보 수정
	void deleteMember(long bno); //회원 탈퇴
	public MemberVO read(String id);
	
	public int getTotalCount(Criteria cri);
	public List<MemberVO> getMemListWithPasing(Criteria cri);
}
