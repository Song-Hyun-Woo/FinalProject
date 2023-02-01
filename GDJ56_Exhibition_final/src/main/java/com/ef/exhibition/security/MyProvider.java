package com.ef.exhibition.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.ef.exhibition.member.model.service.MemberService;
import com.ef.exhibition.member.model.vo.Member;

@Component
public class MyProvider implements AuthenticationProvider{
    @Autowired
    private MemberService service;
    @Autowired
    private BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
    
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		//DB 데이터에서 인증하는 내용을 구성
		String userId = authentication.getName(); //입력받은 아이디
		String password = (String)authentication.getCredentials(); //입력받은 비밀번호
		
//		Member loginMember =(Member)service.loadUserByUsername(username);
		
//		if(loginMember==null|| !encoder.matches(password,loginMember.getPassword()))
			throw new BadCredentialsException("인증실패");
		
		
//		return new UsernamePasswordAuthenticationToken(loginMember,
//				loginMember.getPassword(),loginMember.getAuthorities());
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
