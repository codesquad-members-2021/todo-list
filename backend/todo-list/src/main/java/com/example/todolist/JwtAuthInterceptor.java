package com.example.todolist;

import com.example.todolist.domain.User;
import com.example.todolist.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JwtAuthInterceptor implements HandlerInterceptor {
    @Autowired
    private JwtUtil jwtUtil;

    @Resource
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        logger.info("interceptor!");
        System.out.println("interceptor!!!");
        Cookie[] cookies = request.getCookies();

        String token = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("jwtToken")) {
                token = cookie.getValue();
            }
            if (cookie.getName().equals("userId")) {
                userId = cookie.getValue();
            }
        }

        jwtUtil.verifyToken(token);
        User user = userService.findUserByToken(token);
        request.setAttribute("user", user);
        return true;
    }
}
