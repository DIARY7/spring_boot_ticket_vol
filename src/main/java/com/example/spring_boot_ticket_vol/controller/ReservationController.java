package com.example.spring_boot_ticket_vol.controller;


import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring_boot_ticket_vol.entity.Place;
import com.example.spring_boot_ticket_vol.entity.PlaceVol;
import com.example.spring_boot_ticket_vol.entity.Reservation;
import com.example.spring_boot_ticket_vol.entity.Utilisateur;
import com.example.spring_boot_ticket_vol.service.PlaceService;
import com.example.spring_boot_ticket_vol.service.PlaceVolService;
import com.example.spring_boot_ticket_vol.service.ReservationService;
import com.example.spring_boot_ticket_vol.service.VolService;

import java.util.List;

@Controller
@RequestMapping("/reservation")
@AllArgsConstructor
public class ReservationController {
    private final ReservationService reservationService;
    private final PlaceVolService placeVolService;
    private final PlaceService placeService;
    private final VolService volService;

    // @GetMapping("")
    // public String getAllReservations(HttpSession session, Model model) {
    //     Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
    //     List<Reservation> reservations = reservationService.getReservationByIdUtilisateur(utilisateur);
    //     model.addAttribute("page/reservation/liste", reservations);
    //     return "template";
    // }

    @GetMapping("/")
    public String getAllReservations(Model model) {
        List<Reservation> reservations = reservationService.getAllReservation();
        model.addAttribute("liste", reservations);
        model.addAttribute("page", "pages/reservation/liste");
        return "template";
    }

//    @GetMapping("/formulaire/{idVol}")
//    public String formulaireReservation(@PathVariable Integer idVol, HttpSession session, Model model) {
//
//
//
//    }

    @PostMapping("/reserver")
    public String reserveReservation(HttpSession session, BindingResult result,Reservation reservation) {
        Utilisateur Utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        reservation.setUtilisateur(Utilisateur);
        PlaceVol placeVol = placeVolService.findById(reservation.getPlaceVol().getId());
        reservation.setPlaceVol(placeVol);

        if (placeService.placeIsAvailable(reservation.getPlaceVol().getVol().getId(),reservation.getPlaceVol().getPlace().getTypeSiege().getId(),reservation.getNbPlaces())){
            // do reservation

        }else {
            Place placeDispo = placeService.findPlaceByIdVolAndTypeSiege(reservation.getPlaceVol().getVol().getId(),reservation.getPlaceVol().getPlace().getTypeSiege().getId());
            result.rejectValue("nbPlace","error.nbPlace","Nombre de place insuffisant pour ce vol place restant "+placeDispo.getNombre());
            //use it <span th:if="${#fields.hasErrors('name')}" th:errors="*{name}" class="error"></span>
            return "/reservation/formulaire";
        }
        return "redirect:/reservation";
    }

}
