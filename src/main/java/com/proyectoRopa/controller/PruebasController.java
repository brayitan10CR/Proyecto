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
@RequestMapping("/pruebas")
public class PruebasController {

    @Autowired
    private ProductoService productoService;

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/listado")
    public String listado(Model model) {
        var lista = productoService.getProductos(false);
        model.addAttribute("productos", lista);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);

        return "/pruebas/listado";
    }

    @GetMapping("/listado/{idCategoria}")
    public String listado(Model model, Categoria categoria) {
        categoria = categoriaService.getCategoria(categoria);
        model.addAttribute("productos", categoria.getProductos());
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);

        return "/pruebas/listado";
    }

    @PostMapping("/query1")
    public String query4(@RequestParam("descripcion") String descripcion,
            Model model) {
        var lista = productoService.consultaJPQLdescripcion(descripcion);
        model.addAttribute("productos", lista);
        model.addAttribute("descripcion", descripcion);

        return "/pruebas/listado";
    }

}
