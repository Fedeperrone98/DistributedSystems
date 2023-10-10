package com.unipi.dsmt.app.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import jakarta.servlet.http.HttpServletRequest;

public class AccessController {
    private static final int EXPIRATION_TIME = 86400000; // Tempo di scadenza del JWT (1 giorno)
    private static final String SECRET_KEY = "your-secret-key"; // Chiave segreta per firmare il JWT
    static String token;

    public static void setToken(HttpServletRequest request, String username, String password) {
        
        Map<String, Object> claims = new HashMap<>();
        claims.put("username", username);
        claims.put("password", password);
        
        token = Jwts.builder()
            .setClaims(claims)
            .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
            .signWith(SignatureAlgorithm.HS512, SECRET_KEY)
            .compact();

        request.getSession().setAttribute("TOKEN", token);

    }

    public static String getToken(HttpServletRequest request) {
        return (String) request.getSession().getAttribute("TOKEN");
    }
}
