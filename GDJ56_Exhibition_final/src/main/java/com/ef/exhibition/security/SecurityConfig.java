package com.ef.exhibition.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsUtils;

//시큐리티설정 클래스!
@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	//2. 암호화 Bean등록
	@Bean
	   public BCryptPasswordEncoder bCryptPasswordEncoder() {
		   return new BCryptPasswordEncoder();
	   }
	
	//3. 시큐리티 설정	
		@Bean
		public SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception{
		
			return http.csrf().disable()
						.formLogin()
							.successForwardUrl("/loginsuccess")
							.and()
						.authorizeHttpRequests()
							.antMatchers("/**").permitAll()
							.and()
						.logout()
							.logoutUrl("/logout.do")
							.and()
						.build();
		
		}
	
	
	
}
