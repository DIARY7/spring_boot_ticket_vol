package com.example.spring_boot_ticket_vol.config;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.spring_boot_ticket_vol.entity.Utilisateur;

@Component
public class AuthIntercepter implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("utilisateur");
        if (utilisateur == null) {
            response.sendRedirect("/login");
            return false;
        }
        return true;
    }
}
