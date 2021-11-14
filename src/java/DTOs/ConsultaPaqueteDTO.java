/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author pabli
 */
public class ConsultaPaqueteDTO implements Serializable {
    private String nombre;
    private String descripcion;
    private String fechaInicio;
    private String fechaFin;
    private String descuento;


    public ConsultaPaqueteDTO(String nombre, String descripcion, String fechaInicio, String fechaFin, String descuento, String imagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descuento = descuento;

        this.imagen = imagen;
    }
    private String imagen;

    public ConsultaPaqueteDTO() {
    }

    
    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public String getDescuento() {
        return descuento;
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

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
 
    
    
}
