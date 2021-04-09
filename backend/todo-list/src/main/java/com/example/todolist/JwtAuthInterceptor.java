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
    private static final Logger logger = LoggerFactory.getLogger(JwtAuthInterceptor.class);

    @Autowired
    private JwtUtil jwtUtil;

    @Resource
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        logger.info("interceptor!");
        try {
            Cookie[] cookies = request.getCookies();

            String token = "";
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("jwtToken")) {
                    token = cookie.getValue();
                }
            }

            jwtUtil.verifyToken(token);

            User user = userService.findUserByToken(token);
            request.setAttribute("user", user);
        } catch (Exception e) {
            logger.error("유효한 사용자 정보가 없습니다.");
            return false;
        }
        return true;
    }
}
