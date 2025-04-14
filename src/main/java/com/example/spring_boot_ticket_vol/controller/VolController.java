package com.example.spring_boot_ticket_vol.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring_boot_ticket_vol.service.VolService;

import java.util.List;

@Controller
@RequestMapping("/vol")
@AllArgsConstructor
public class VolController {
    private final VolService volService;

//    @GetMapping("")
//    public String listVolValid(Model model) {
//        List<VolDTO> volDTOS = volService.findAllVolDTOValid();
//        model.addAttribute("volDTOS", volDTOS);
//        return "vol/listVolValid";
//    }
}
