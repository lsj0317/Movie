package com.firstgroup.movies.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j2;


@Log4j2

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)throws IOException,ServletException{
		
		log.warn("login success");
		List<String> roleNames=new ArrayList<>();
		auth.getAuthorities().forEach(authority->{
			
			roleNames.add(authority.getAuthority());
						
		});
		log.warn("ADMIN");
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/home");
			return;
		}
		response.sendRedirect("/home");
	}
	
	

}
