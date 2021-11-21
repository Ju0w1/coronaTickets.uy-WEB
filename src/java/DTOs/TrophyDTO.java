/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.util.Date;

/**
 *
 * @author milto
 */
public class TrophyDTO {
    private String usuario;
    private String descripcion;
    private String nombreFuncion;
    private Date fecha;

    public TrophyDTO() {
    }

    public TrophyDTO(String usuario, String descripcion, String nombreFuncion, Date fecha) {
        this.usuario = usuario;
        this.descripcion = descripcion;
        this.nombreFuncion = nombreFuncion;
        this.fecha = fecha;
    }

    public TrophyDTO(String usuario, String descripcion, String nombreFuncion) {
        this.usuario = usuario;
        this.descripcion = descripcion;
        this.nombreFuncion = nombreFuncion;
    }
    
    public String getUsuario() {
        return usuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getNombreFuncion() {
        return nombreFuncion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setNombreFuncion(String nombreFuncion) {
        this.nombreFuncion = nombreFuncion;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
    
}
