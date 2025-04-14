package com.example.spring_boot_ticket_vol.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.spring_boot_ticket_vol.entity.Parametres;

@Repository
public interface ParametresRepository extends JpaRepository<Parametres, Integer> {

    Parametres findParametresByCle(String cle);
}
