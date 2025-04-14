package com.example.spring_boot_ticket_vol.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.PlaceVol;
import com.example.spring_boot_ticket_vol.repository.PlaceVolRepository;

@Service
@AllArgsConstructor
public class PlaceVolService {
    private final PlaceVolRepository placeVolRepository;

    public PlaceVol findById(int id) {
        return placeVolRepository.findById(id).orElse(null);
    }

}
