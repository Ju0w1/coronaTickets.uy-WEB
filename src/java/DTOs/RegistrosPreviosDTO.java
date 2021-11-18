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
public class RegistrosPreviosDTO implements Serializable{
    private String nombre;
    private Date fecha;
    private boolean canjeado;

    public RegistrosPreviosDTO() {
    }

    public RegistrosPreviosDTO(String nombre, Date fecha, boolean canjeado) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.canjeado = canjeado;
    }

    public String getNombre() {
        return nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public boolean isCanjeado() {
        return canjeado;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setCanjeado(boolean canjeado) {
        this.canjeado = canjeado;
    }
    
    
    
}
