package com.example.spring_boot_ticket_vol.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.spring_boot_ticket_vol.entity.PlaceVol;

@Repository
public interface PlaceVolRepository  extends JpaRepository<PlaceVol, Integer> {
}
