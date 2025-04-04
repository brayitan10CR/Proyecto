package com.proyectoRopa.controller;

import com.proyectoRopa.domain.Categoria;
import com.proyectoRopa.domain.Producto;
import com.proyectoRopa.service.CategoriaService;
import com.proyectoRopa.service.*;
import com.proyectoRopa.service.FirebaseStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class IndexController {

    @Autowired
    private ProductoService productoService;

    @GetMapping("/")
    public String listado(Model model) {
        var lista = productoService.getProductos(true);
        model.addAttribute("productos", lista);
        return "/index";
    }

}
