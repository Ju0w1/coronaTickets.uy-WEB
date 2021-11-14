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
public class EspectaculoPaqueteDTO implements Serializable {
    private String nombre;
    private String descripcion;
    private String costo;
    private String imagen;

    public EspectaculoPaqueteDTO() {
    }

    public EspectaculoPaqueteDTO(String nombre, String descripcion, String costo, String imagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.costo = costo;
        this.imagen = imagen;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getCosto() {
        return costo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
}
