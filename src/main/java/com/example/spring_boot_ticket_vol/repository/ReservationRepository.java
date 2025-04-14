package com.example.spring_boot_ticket_vol.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.example.spring_boot_ticket_vol.entity.Reservation;
import com.example.spring_boot_ticket_vol.entity.Utilisateur;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> findByUtilisateur(Utilisateur utilisateur);
}
