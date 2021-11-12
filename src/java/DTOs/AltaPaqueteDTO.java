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
public class AltaPaqueteDTO implements Serializable {

    private String nombre;
    private String fechaInicio;
    private String fechaFin;
    private String fechaCreado;
    private double descuento;
    private String descipcion;
    private String imagen;

    public AltaPaqueteDTO() {
    }

    public AltaPaqueteDTO(String nombre, String fechaInicio, String fechaFin, String fechaCreado, double descuento, String descipcion, String imagen) {
        this.nombre = nombre;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.fechaCreado = fechaCreado;
        this.descuento = descuento;
        this.descipcion = descipcion;
        this.imagen = imagen;
    }

    public String getNombre() {
        return nombre;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public String getFechaCreado() {
        return fechaCreado;
    }

    public double getDescuento() {
        return descuento;
    }

    public String getDescipcion() {
        return descipcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public void setFechaCreado(String fechaCreado) {
        this.fechaCreado = fechaCreado;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public void setDescipcion(String descipcion) {
        this.descipcion = descipcion;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
            
}
