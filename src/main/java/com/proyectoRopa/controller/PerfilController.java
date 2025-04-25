package com.proyectoRopa.controller;

import com.proyectoRopa.domain.Usuario;
import com.proyectoRopa.repository.UsuarioRepository;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/perfil")
public class PerfilController {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @GetMapping("/listado")
    public String mostrarListado(Model model, Principal principal) {
        // Obtener username del usuario autenticado
        String username = principal.getName();

        // Buscar el usuario completo en la base de datos
        Usuario usuario = usuarioRepository.findByUsername(username);

        // Agregar el usuario al modelo para que esté disponible en la vista
        model.addAttribute("usuario", usuario);

        return "perfil/listado";
    }

}
