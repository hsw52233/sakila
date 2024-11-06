package com.example.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class SakilaApplication implements WebMvcConfigurer {
	@Autowired 
	private OnInterceptor onInterceptor;
	@Autowired 
	private OffInterceptor offInterceptor;
	
	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}
	
	// 인터셉터 설정( 1)인터셉터 클래스 구현 2)인터셉터 맵핑
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// InterceptorRegistry registry : 인터셉터 리스트(맵핑가능)
		// /on/*으로 시작하는 컨터롤러 가로채어 onInterceptor.preHandle(request, respone)
		registry.addInterceptor(onInterceptor).addPathPatterns("/on/**");
		registry.addInterceptor(offInterceptor).addPathPatterns("/off/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}
