package com.example.spring_boot_ticket_vol.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.PlaceVol;
import com.example.spring_boot_ticket_vol.entity.Promotion;
import com.example.spring_boot_ticket_vol.entity.Reservation;
import com.example.spring_boot_ticket_vol.entity.Utilisateur;
import com.example.spring_boot_ticket_vol.repository.ReservationRepository;

import java.util.List;

@Service
@AllArgsConstructor
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final PromotionService promotionService;

    public List<Reservation> getAllReservation(){
        return reservationRepository.findAll();
    }

    public List<Reservation> getReservationByIdUtilisateur(Utilisateur utilisateur) {
        return reservationRepository.findByUtilisateur(utilisateur);
    }

    public Reservation getReservationById(Integer id) {
        return reservationRepository.findById(id.longValue())
                .orElseThrow(() -> new RuntimeException("Réservation non trouvée avec l'ID: " + id));
    }

    public void setPromotion(Reservation reservation) {
        PlaceVol placeVol = reservation.getPlaceVol();
        List<Promotion> promotions = promotionService.findPromotionValidByVolAndTypeSiege(placeVol.getVol().getId(),
                placeVol.getPlace().getTypeSiege().getId());
    }
}
