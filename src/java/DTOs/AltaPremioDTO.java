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
public class AltaPremioDTO implements Serializable{
    private String nomEspec;
    private String descripcion;
    private int cantidad;

    public AltaPremioDTO() {
    }

    public AltaPremioDTO(String nomEspec, String descripcion, int cantidad) {
        this.nomEspec = nomEspec;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
    }

    public String getNomEspec() {
        return nomEspec;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setNomEspec(String nomEspec) {
        this.nomEspec = nomEspec;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
}
