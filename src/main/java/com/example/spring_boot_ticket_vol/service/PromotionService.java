package com.example.spring_boot_ticket_vol.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import com.example.spring_boot_ticket_vol.entity.Promotion;
import com.example.spring_boot_ticket_vol.entity.Vol;
import com.example.spring_boot_ticket_vol.repository.PromotionRepository;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class PromotionService {
    private final PromotionRepository promotionRepository;

    public List<Promotion> findByVol(Vol  vol) {
        return promotionRepository.findByVol(vol);
    }

    // encore disponible
    public List<Promotion> findPromotionValidByVol(Vol vol){
        return promotionRepository.findPromotionValideByVol(vol.getId());
    }
    public List<Promotion> findPromotionValidByVolAndTypeSiege(Integer idVol, Integer idTypeSiege){
        return promotionRepository.findPromotionValideByVolAndTypeSiege(idVol, idTypeSiege);
    }

}
