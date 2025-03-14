
package com.proyectoRopa.repository;

import com.proyectoRopa.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CategoriaRepository 
        extends JpaRepository <Categoria,Long>{
    
}
