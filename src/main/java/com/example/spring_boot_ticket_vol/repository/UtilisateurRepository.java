package com.example.spring_boot_ticket_vol.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.spring_boot_ticket_vol.entity.Utilisateur;

@Repository
public interface UtilisateurRepository  extends JpaRepository<Utilisateur, Integer> {

    @Query(value = "SELECT * FROM utilisateur " +
            "WHERE pseudo = :pseudo " +
            "AND mot_de_passe = :motDePasse "
            ,nativeQuery = true)
    Utilisateur loginUTilisateur(String pseudo,String motDePasse);
}
