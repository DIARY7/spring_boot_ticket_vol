package com.example.spring_boot_ticket_vol.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.Avion;
import com.example.spring_boot_ticket_vol.entity.Place;
import com.example.spring_boot_ticket_vol.repository.PlaceRepository;

import java.util.List;

@Service
@AllArgsConstructor
public class PlaceService {
    private final PlaceRepository placeRepository;

    public List<Place> findAll() {
        return placeRepository.findAll();
    }

    public Place findById(int id) {
        return placeRepository.findById(id).orElse(null);
    }

    public List<Place> findByAvion(Avion avion) {
        return placeRepository.findByIdAvion(avion);
    }

    public Place findPlaceByIdVolAndTypeSiege(int idVol, int idTypeSiege) {
        return placeRepository.findPlaceByVolAndTypeSiege(idVol, idTypeSiege);
    }

    public Boolean placeIsAvailable(int idVol, int idTypeSiege,int placeDemander) {
        Place place = findPlaceByIdVolAndTypeSiege(idVol, idTypeSiege);
        if (place == null) {
            return false;
        } else return place.getNombre() >= placeDemander;
    }
}
