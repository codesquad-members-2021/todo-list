package com.example.todolist;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.stereotype.Component;


import java.util.Date;

@Component
public class JwtUtil {
    private String SECRET_KEY = "SECRETKEY";
    private Date expiredTime = new Date(System.currentTimeMillis() + 60 * 60 * 3 * 1000);
    private String ISSUER = "test";

    public String createToken() {
        return JWT.create()
                .withIssuer(ISSUER)
                .withExpiresAt(expiredTime)
                .sign(Algorithm.HMAC256(SECRET_KEY));
    }

    public void verifyToken(String token) {
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(SECRET_KEY))
                .withIssuer(ISSUER)
                .build();
        verifier.verify(token);
    }
}
