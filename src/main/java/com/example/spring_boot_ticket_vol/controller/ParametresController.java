package com.example.spring_boot_ticket_vol.controller;

import lombok.AllArgsConstructor;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.spring_boot_ticket_vol.entity.Parametres;
import com.example.spring_boot_ticket_vol.service.ParametresService;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/parametres")
public class ParametresController {
    private final ParametresService parametresService;

    @GetMapping("/")
    public String getParametresRepository(@ModelAttribute(name = "error", binding = false) String error,
            @ModelAttribute(name = "success", binding = false) String successMessage,Model model) {
        if (error != null) {
            model.addAttribute("errorMessage", error);
        }
        
        if (successMessage != null && !successMessage.isEmpty()) {
            model.addAttribute("successMessage", successMessage);
        }

        model.addAttribute("delaiReservation", parametresService.getParametresByCle("delai_reservation").getValeur());
        model.addAttribute("delaiAnnulation", parametresService.getParametresByCle("delai_annulation").getValeur());
        model.addAttribute("reductionEnfant", parametresService.getParametresByCle("reduc_enfant").getValeur());
        model.addAttribute("page", "pages/parametres/form");
        return "template";
    }

    @PostMapping("/update/{cle}")
    public String updateParametres(RedirectAttributes redirectAttributes,String valeur,@PathVariable(name = "cle") String cle,Model model) {
        Parametres parametres = parametresService.getParametresByCle(cle);
        parametres.setValeur(valeur);
        try {
            parametresService.updateParametres(parametres);
            redirectAttributes.addFlashAttribute("success", "Le parametre <span class='success'>"+cle+"</span> a bien été modifié" );    
        } catch (Exception e) {
            // TODO: handle exception
            redirectAttributes.addFlashAttribute("error", "Erreur lors du modification du parametre <span <span class='error'>"+cle+"</span> a bien été modifié" );
            e.printStackTrace();
        }
        
        
        return "redirect:/parametres/";
    }


}
