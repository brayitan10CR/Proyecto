
package com.proyectoRopa.controller;

import com.proyectoRopa.domain.Categoria;
import com.proyectoRopa.service.CategoriaService;
import com.proyectoRopa.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/descuentos")
public class DescuentosController {
    
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

        return "/descuentos/listado";
    }

    @GetMapping("/listado/{idCategoria}")
    public String listado(Model model, Categoria categoria) {
        categoria = categoriaService.getCategoria(categoria);
        model.addAttribute("productos", categoria.getProductos());
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);

        return "/descuentos/listado";
    }
}
