package com.lemarket.service.utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.crypto.MacProvider;

import javax.crypto.SecretKey;
import java.util.Date;

public class TokenFactory {

    /**
     * 加密 jwt
     * @param username,tlMillis 用户名,有效时间
     * @return claims
     */

    public static String create(String username, long ttlMillis) {

        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256 ;
        long nowMillis = System. currentTimeMillis();
        Date now = new Date(nowMillis);
        SecretKey key = MacProvider.generateKey();
        JwtBuilder builder = Jwts.builder()
                .setIssuedAt(now)
                .setSubject(username)
                .signWith(signatureAlgorithm, key);
        if (ttlMillis >= 0){
            long expMillis = nowMillis + ttlMillis;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp);
        }
        return builder.compact();
    }

    /**
     * 解密 jwt
     * @param token jwt
     * @return claims
     * @throws Exception 解码
     */
    public static Claims decode(String token) throws Exception{
        SecretKey key = MacProvider.generateKey();
        return Jwts.parser()
                .setSigningKey(key)
                .parseClaimsJws(token).getBody();
    }

}
