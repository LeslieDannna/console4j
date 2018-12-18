package com.leslie.security.admin.jwt;

import com.leslie.security.admin.auth.AuthUser;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Leslie.Lam
 * @create 2018-12-08 23:24
 **/
public abstract class JwtTokenUtil {

    public static final String TOKEN_TYPE_BEARER = "Bearer ";
    public static final String AUTH_HEADER = "Authorization";
    private static Long EXPIRATION = 3600*24*30*1000L;
    private final static String SUBJECT = "JWT_USER_AUTH";
    private static byte[] SECRET = "e1a2349d22efb0d3188d32245a081790".getBytes();
    private static SecretKey KEY = Keys.hmacShaKeyFor(SECRET);


    public static Date getIssueAtDateFromToken(String token) {
        return getClaimFromToken(token).getIssuedAt();
    }

    public static Date getExpirationDateFromToken(String token) {
        return getClaimFromToken(token).getExpiration();
    }

    public static String getAudienceFromToken(String token) {
        return getClaimFromToken(token).getAudience();
    }

    public static String getPrivateClaimFromToken(String token, String key) {
        return getClaimFromToken(token).get(key).toString();
    }

    public static Claims getClaimFromAuthHeader(String authHeader) {
        return authHeader != null && authHeader.startsWith(TOKEN_TYPE_BEARER)?getClaimFromToken(authHeader.substring(7)):null;
    }

    public static Claims getClaimFromToken(String token) {
        return Jwts.parser().setSigningKey(KEY).parseClaimsJws(token).getBody();
    }

    public static String generateToken(AuthUser user) {
        Map<String,Object> claims = new HashMap<>();
        claims.put("userId",user.getId());
        return TOKEN_TYPE_BEARER+Jwts.builder().setSubject(SUBJECT).setAudience(user.getUserName()).setIssuedAt(new Date())
                .addClaims(claims)
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRATION))
                .signWith(KEY,SignatureAlgorithm.HS256).compact();
    }


}
