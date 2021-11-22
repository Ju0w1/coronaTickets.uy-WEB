/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author pabli
 */
public class EspecFinalizadoDTO implements Serializable{
    private String nombre;
    private String descripción;
    private String imagen;

    public EspecFinalizadoDTO(String nombre, String descripción, String imagen) {
        this.nombre = nombre;
        this.descripción = descripción;
        this.imagen = imagen;
    }

    public EspecFinalizadoDTO() {
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripción() {
        return descripción;
    }

    public String getImagen() {
        return imagen;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripción(String descripción) {
        this.descripción = descripción;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
}
