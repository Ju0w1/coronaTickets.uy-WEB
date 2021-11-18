/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

/**
 *
 * @author pabli
 */
public class AltaFuncionDTO {
    String nombre;
    private Date fecha;
    private Time horaInicio;
    private Date fechaRegistro;
    private String urlImagen;
    private String nombreEspectaculo;
    List<String> artistas;

    public AltaFuncionDTO() {
    }

    public AltaFuncionDTO(String nombre, Date fecha, Time horaInicio, Date fechaRegistro, String urlImagen, String nombreEspectaculo, List<String> artistas) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.fechaRegistro = fechaRegistro;
        this.urlImagen = urlImagen;
        this.nombreEspectaculo = nombreEspectaculo;
        this.artistas = artistas;
    }
    

    public String getNombre() {
        return nombre;
    }

    public Date getFecha() {
        return fecha;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public String getNombreEspectaculo() {
        return nombreEspectaculo;
    }

    public List<String> getArtistas() {
        return artistas;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }

    public void setNombreEspectaculo(String nombreEspectaculo) {
        this.nombreEspectaculo = nombreEspectaculo;
    }

    public void setArtistas(List<String> artistas) {
        this.artistas = artistas;
    }

    
}
