package com.example.spring_boot_ticket_vol.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

import com.example.spring_boot_ticket_vol.entity.Avion;
import com.example.spring_boot_ticket_vol.entity.Place;
import com.example.spring_boot_ticket_vol.entity.Ville;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VolDTO {
    Integer idVol;
    LocalDateTime dateDepart;
    Ville villeDepart;
    Ville villeArrivee;
    Avion avion;
    List<Place> placeDispo;
}
