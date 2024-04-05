package com.firstgroup.movies.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j2;

@Log4j2

public class CustomNoOpPasswordEncoder implements PasswordEncoder{
	
	public String encode(CharSequence rawPassword) {
		log.warn("before encode" + rawPassword);
		return rawPassword.toString();
	}
	public boolean matches(CharSequence rawPassword, String encodePassword) {
		log.warn("mathes" + rawPassword +":"+encodePassword);
		
		return rawPassword.toString().equals(encodePassword);
		
	}
}
