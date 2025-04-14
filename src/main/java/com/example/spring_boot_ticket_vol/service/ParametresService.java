package com.example.spring_boot_ticket_vol.service;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.Parametres;
import com.example.spring_boot_ticket_vol.repository.ParametresRepository;

import java.util.List;

@AllArgsConstructor
@Service
public class ParametresService {
    private final ParametresRepository parametresRepository;

    public Parametres createParametres(Parametres parametres) {
        return parametresRepository.save(parametres);
    }

    public List<Parametres> getAllParametres() {
        return parametresRepository.findAll();
    }

    public Parametres getParametresByCle(String cle){
        return parametresRepository.findParametresByCle(cle);
    }

    public Parametres updateParametres(Parametres parametres) {
         return parametresRepository.save(parametres);
    }
}
