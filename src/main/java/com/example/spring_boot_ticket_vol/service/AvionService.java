package com.example.spring_boot_ticket_vol.service;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.Avion;
import com.example.spring_boot_ticket_vol.repository.AvionRepository;

import java.util.List;

@Service
@AllArgsConstructor
public class AvionService {
    private final AvionRepository avionRepository;

    public List<Avion> findAll() {
        return avionRepository.findAll();
    }

    public Avion findById(Integer id) {
        return avionRepository.findById(id).orElse(null);
    }



}
