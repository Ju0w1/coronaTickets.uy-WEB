package DTOs;

import java.io.Serializable;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pabli
 */
public class AltaEspectaculoDTO implements Serializable{
    //String nombrePlataforma, String nombreOrganizador, String nombreEspectaculo, String descripcion, Double duracion, int cantEspectadoresMinima, int cantEspectadoresMaxima, String URL, Double Costo, String estado, String imagen, String[] categorias
    //plataforma, nickname, nombre, descripcion, duracion, especMin, especMax, url, costo, "i", urlImagen, categorias
    private String plataforma;
    private String nickname;
    private String nombreEspec;
    private String descripcion;
    private double duracion;
    private int especMin;
    private int especMax;
    private String url;
    private double costo;
    private String estado;
    private String imagen;
    private String[] categorias;

    public AltaEspectaculoDTO(String plataforma, String nickname,String nombreEspec, String descripcion, double duracion, int especMin, int especMax, String url, double costo, String estado, String imagen, String[] categorias) {
        this.plataforma = plataforma;
        this.nickname = nickname;
        this.nombreEspec = nombreEspec;
        this.descripcion = descripcion;
        this.duracion = duracion;
        this.especMin = especMin;
        this.especMax = especMax;
        this.url = url;
        this.costo = costo;
        this.estado = estado;
        this.imagen = imagen;
        this.categorias = categorias;
    }

    public AltaEspectaculoDTO() {
    }
//GETTERS

    public String getNombreEspec() {
        return nombreEspec;
    }
    
    public String getPlataforma() {
        return plataforma;
    }

    public String getNickname() {
        return nickname;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public double getDuracion() {
        return duracion;
    }

    public int getEspecMin() {
        return especMin;
    }

    public int getEspecMax() {
        return especMax;
    }

    public String getUrl() {
        return url;
    }

    public double getCosto() {
        return costo;
    }

    public String getEstado() {
        return estado;
    }

    public String getImagen() {
        return imagen;
    }

    public String[] getCategorias() {
        return categorias;
    }
//SETTERS

    public void setNombreEspec(String nombreEspec) {
        this.nombreEspec = nombreEspec;
    }
    
    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setDuracion(double duracion) {
        this.duracion = duracion;
    }

    public void setEspecMin(int especMin) {
        this.especMin = especMin;
    }

    public void setEspecMax(int especMax) {
        this.especMax = especMax;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public void setCategorias(String[] categorias) {
        this.categorias = categorias;
    }
    
    
    
}
