package com.firstgroup.movies.security;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.firstgroup.movies.domain.AuthVO;
import com.firstgroup.movies.domain.MemberVO;
import com.firstgroup.movies.mapper.MemberMapper;
import com.firstgroup.movies.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + id);
		
		if ("guest".equals(id)) {
	        // Guest 사용자의 권한 설정
	        //List<GrantedAuthority> authorities = Arrays.asList(new SimpleGrantedAuthority("ROLE_GUEST"));
	        MemberVO vo = new MemberVO();
	        vo.setId(id);
	        vo.setName(id);;
	        vo.setNickName(id);
	        List<AuthVO> auVO = new ArrayList<AuthVO>();
	        AuthVO au = new AuthVO();
	        au.setId(id);
	        au.setAuth("ROLE_GUEST");
	        auVO.add(au);
	        vo.setAuthList(auVO);
	        
	        log.info(vo);
	        // Guest 사용자를 나타내는 UserDetails 객체 생성
	        return new CustomUser(vo);
		    } else { 
			// userName means userid
			MemberVO vo = this.memberMapper.read(id);
	
			log.warn("queried by member mapper: " + vo);
			
			return vo == null ? null : new CustomUser(vo);
	    }
	}
}
