package com.example.todolist;


import com.example.todolist.common.CustomHandlerMethodArgumentResolver;
import com.example.todolist.common.JwtAuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;


@EnableWebMvc
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private CustomHandlerMethodArgumentResolver customHandlerMethodArgumentResolver;

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(customHandlerMethodArgumentResolver);
    }

    @Bean
    public JwtAuthInterceptor jwtAuthInterceptor() {
        return new JwtAuthInterceptor();
    }

    private final String[] EXCLUDED_PATH_LIST = {
            "/list",
            "/history"
    };

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(jwtAuthInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(EXCLUDED_PATH_LIST);
    }
}
