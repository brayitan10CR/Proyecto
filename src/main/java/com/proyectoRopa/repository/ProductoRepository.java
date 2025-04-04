
package com.proyectoRopa.repository;

import com.proyectoRopa.domain.Producto;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface ProductoRepository 
        extends JpaRepository <Producto,Long>{
    
    //Consulta JPQL
    @Query(value="SELECT a FROM Producto a WHERE a.descripcion LIKE %:descripcion% ORDER BY a.descripcion")
     public List<Producto> consultaJPQLdescripcion(
            String descripcion);
    
}
