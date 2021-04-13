package com.example.todolist;

import com.auth0.jwt.interfaces.DecodedJWT;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.codec.binary.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;


import java.util.Map;

public class JwtAuthInterceptor implements HandlerInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(JwtAuthInterceptor.class);

    @Autowired
    private JwtUtil jwtUtil;

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

            DecodedJWT decodedJWT = jwtUtil.verifyToken(token);
            final String payloadJson = StringUtils.newStringUtf8(Base64.decodeBase64(decodedJWT.getPayload()));
            ObjectMapper mapper = new ObjectMapper();
            Map<String, String> map = mapper.readValue(payloadJson, Map.class);

            request.setAttribute("name", map.get("sub"));
        } catch (Exception e) {
            logger.error("유효한 사용자 정보가 없습니다.");
            return false;
        }
        return true;
    }
}
