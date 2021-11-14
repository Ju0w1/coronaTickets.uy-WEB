/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author milto
 */
public class EditUserDTO implements Serializable{
    private String nombre;
    private String apellido;
    private String fecha;
    private String imagen;

    public EditUserDTO(String nombre, String apellido, String fecha, String imagen) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
        this.imagen = imagen;
    }
    
    public EditUserDTO(){
        
    }
    
    //GETTERS
    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getFecha() {
        return fecha;
    }

    public String getImagen() {
        return imagen;
    }
    
    //SETTERS
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
}
