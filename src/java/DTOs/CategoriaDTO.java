/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author facun
 */
public class CategoriaDTO implements Serializable {
    private String nombre;
    
    //CONSRUCTOR
    public CategoriaDTO (String nombre) {
        this.nombre = nombre;
    }

    public CategoriaDTO() {
    }
    
    
    
    //GETTERS
    public String getNombre() {
        return nombre;
    }
    
    //SETTERS
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
