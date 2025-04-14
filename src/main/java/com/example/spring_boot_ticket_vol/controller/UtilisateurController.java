package com.example.spring_boot_ticket_vol.controller;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring_boot_ticket_vol.entity.Utilisateur;
import com.example.spring_boot_ticket_vol.service.UtilisateurService;

@AllArgsConstructor
@Controller
public class UtilisateurController {
    private final UtilisateurService utilisateurService;

    @PostMapping("/login")
    public String login(HttpSession session, Model model, @RequestParam(name = "pseudo") String pseudo, @RequestParam(name = "motDePasse") String password) {
        Utilisateur utilisateur = utilisateurService.login(pseudo,password);
        if (utilisateur != null) {
            session.setAttribute("utilisateur", utilisateur);
        }
        else {
            model.addAttribute("loginError", "Invalid username or password");
            return "index";
        }
        return "redirect:/parametres/";
    }

    @GetMapping("/login")
    public String loginFOrm(){
        return "index";
    }


}
