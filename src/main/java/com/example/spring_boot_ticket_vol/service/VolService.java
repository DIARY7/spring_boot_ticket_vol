package com.example.spring_boot_ticket_vol.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.Vol;
import com.example.spring_boot_ticket_vol.repository.VolRepository;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class VolService {
    private final VolRepository volRepository;
    private final PlaceService placeService;

    public Vol findById(int id) {
        return volRepository.findById(id).orElse(null);
    }

    public List<Vol> findAllVolValid() {
        return volRepository.findVolValid();
    }

    ///  DTO

//    public List<VolDTO> findAllVolDTOValid() {
//        List<Vol> vols = volRepository.findVolValid();
//        List<VolDTO> volDTOs = new ArrayList<>();
//        for (Vol vol : vols) {
//            VolDTO dto = new VolDTO();
//            dto.setIdVol(vol.getId());
//            dto.setDateDepart(vol.getDateDepart());
//            dto.setVilleDepart(vol.getIdVilleDepart());
//            dto.setVilleArrivee(vol.getIdVilleArrive());
//            dto.setAvion(vol.getIdAvion());
//            List<Place> placesDispo = new ArrayList<>();
//            List<Place> places = placeService.findByAvion(vol.getIdAvion());
//            for (Place place : places) {
//                placesDispo.add(placeService.findPlaceByIdVolAndTypeSiege(vol.getId(), place.getTypeSiege().getId()));
//            }
//            dto.setPlaceDispo(placesDispo);
//            volDTOs.add(dto);
//        }
//        return volDTOs;
//    }

//    public VolDTO findVolDTOById(int id) {
//        Vol vol = volRepository.findById(id).orElse(null);
//        if (vol == null) {
//            return null;
//        }
//        VolDTO dto = new VolDTO();
//        dto.setIdVol(vol.getId());
//        dto.setDateDepart(vol.getDateDepart());
//        dto.setVilleDepart(vol.getIdVilleDepart());
//        dto.setVilleArrivee(vol.getIdVilleArrive());
//        dto.setAvion(vol.getIdAvion());
//        List<Place> placesDispo = new ArrayList<>();
//        List<Place> places = placeService.findByAvion(vol.getIdAvion());
//        for (Place place : places) {
//            placesDispo.add(placeService.findPlaceByIdVolAndTypeSiege(vol.getId(), place.getTypeSiege().getId()));
//        }
//        dto.setPlaceDispo(placesDispo);
//        return dto;
//    }
}
