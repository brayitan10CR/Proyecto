package com.proyectoRopa.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/perfil")
public class PerfilController {

    @GetMapping("/listado")
    public String mostrarListado(Model model) {
        return "perfil/listado";
    }
}
