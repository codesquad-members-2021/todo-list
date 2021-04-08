package com.example.todolist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {
//    @Autowired
//    private HandlerInterceptor handlerIntercepter;

    private final String[] EXCLUDED_PATH_LIST = {
            "/users/**",
            "/users/login/**"
    };

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new JwtAuthInterceptor())
                .addPathPatterns("/*")
                .excludePathPatterns("/users", "/users/login");
//                .excludePathPatterns(EXCLUDED_PATH_LIST);

    }
}
