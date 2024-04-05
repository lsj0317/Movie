package com.firstgroup.movies.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.firstgroup.movies.domain.AuthVO;
import com.firstgroup.movies.domain.Criteria;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.mapper.AuthMapper;
import com.firstgroup.movies.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	private AuthMapper authMapper;
	
	private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	public List<MemberVO> getMemList(){
		return memberMapper.getMemList();
				
	}
	public MemberVO getMember(String id) {
		return memberMapper.getMember(id);
	}
	public void register(MemberVO memVo) { //회원가입
		if(!memVo.getName().equals("")&& !memVo.getPhone().equals("")) {
			//password는 암호화해서 db에 저장
			
			memVo.setPw(passwordEncoder.encode(memVo.getPw()));
			memberMapper.insertMember(memVo);
			
			AuthVO authVo = new AuthVO();
			authVo.setId(memVo.getId());
			authVo.setAuth("ROLE_MEMBER");
			authMapper.insertAuth(authVo);
		}
		
	}
	public void edit(MemberVO memVo) { //회원 정보 수정
		////password는 암호화해서 db에 저장
		memVo.setPw(passwordEncoder.encode(memVo.getPw()));
		memberMapper.updateMember(memVo);
	}
	public void withdraw(long bno, String id) {
		authMapper.deleteAuth(id);
		memberMapper.deleteMember(bno);
	}
	public PasswordEncoder passwordEncoder() {
		return this.passwordEncoder();
	}
	@Override
	public void updateAuth(AuthVO auth) {
		authMapper.updateAuth(auth);
	}
	@Override
	public int getTotal(Criteria cri) {
		return memberMapper.getTotalCount(cri);
	}
	@Override
	public List<MemberVO> getMemListWithPasing(Criteria cri) {
		return memberMapper.getMemListWithPasing(cri);
	}
}
