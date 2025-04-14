package com.example.spring_boot_ticket_vol.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.Utilisateur;
import com.example.spring_boot_ticket_vol.repository.UtilisateurRepository;

@AllArgsConstructor
@Service
public class UtilisateurService {
    private final UtilisateurRepository utilisateurRepository;

    public Utilisateur createUtilisateur(Utilisateur utilisateur) {
        return utilisateurRepository.save(utilisateur);
    }

    public Utilisateur login(String pseudo,String motDePasse) {
        return utilisateurRepository.loginUTilisateur(pseudo,motDePasse);
     }
}
