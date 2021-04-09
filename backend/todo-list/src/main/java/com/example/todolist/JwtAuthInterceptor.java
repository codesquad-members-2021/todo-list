package com.example.todolist;

import com.example.todolist.domain.User;
import com.example.todolist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtAuthInterceptor implements HandlerInterceptor {
    private static final String HEADER_TOKEN_KEY = "token";
    private String jwt;
    @Autowired
    private JwtUtil jwtUtil;
    @Autowired
    private UserRepository userRepository;

    private Map<String, String> getHeadersInfo(HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        Enumeration headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
            map.put(key, value);
        }
        return map;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Cookie[] cookies = request.getCookies();
        System.out.println(Arrays.toString(cookies));
        String token="";
//        String userId = "";
        for (Cookie cookie : cookies) {
            System.out.println(cookie.getName());
            if (cookie.getName().equals("jwtToken")) {
                token = cookie.getValue();
            }
//            else if (cookie.getName().equals("jwtToken")) {
//                userId = cookie.getValue();
//            }
        }
        jwt = token;
        System.out.println(request.getHeader("userId"));
//        System.out.println(userId);
        User user = userRepository.findById(Long.valueOf(request.getHeader("userId")))
                .orElseThrow(IllegalArgumentException::new);
//        System.out.println(user.toString());
//        User user = userRepository.findByToken(token);
//        String givenToken = request.getHeader(HEADER_TOKEN_KEY);
//        System.out.println("given token:" + givenToken);
        System.out.println("token:"+token);
        verifyToken(token, user.getToken());
        return true;
    }

    public String getJwt() {
        return jwt;
    }

    private void verifyToken(String givenToken, String userToken) {
        if (!givenToken.equals(userToken)) {
            throw new IllegalArgumentException("사용자의 Token과 일치하지 않습니다.");
        }
        jwtUtil.verifyToken(givenToken);
    }


}
