/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import Logica.Clases.Categoria;
import Logica.Clases.Funcion;
import Logica.Clases.Paquete;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 *
 * @author Feder
 */

public class ConsultaEspectaculoDTO implements Serializable {
    private String Nombre;
    private int Artista;
    private String Descripcion;
    private int Cant_min_espectadores;
    private int Cant_max_espectadores;
    private String Url;
    private double Costo;
    private double Duracion;
    private Date Fecha_Registro;
    private List<Categoria> categorias;
    private String url_imagen;
    private List<FuncionDTOConsultaEspectaculo> funciones;
    private List<Paquete> paquetes;
    
    public ConsultaEspectaculoDTO(){
        
    }
    
    public ConsultaEspectaculoDTO(String Nombre, int Artista, String Descripcion, int Cant_min_espectadores, int Cant_max_espectadores, String Url, double Costo, double Duracion, Date Fecha_Registro, List<Categoria> categorias,String url_imagen,List<FuncionDTOConsultaEspectaculo> funciones, List<Paquete> paquetes) {
        this.Nombre = Nombre;
        this.Artista = Artista;
        this.Descripcion = Descripcion;
        this.Cant_min_espectadores = Cant_min_espectadores;
        this.Cant_max_espectadores = Cant_max_espectadores;
        this.Url = Url;
        this.Costo = Costo;
        this.Duracion = Duracion;
        this.Fecha_Registro = Fecha_Registro;
        this.url_imagen = url_imagen;
        this.categorias=categorias;
        this.funciones=funciones;
        this.paquetes=paquetes;
    }

    public String getNombre() {
        return Nombre;
    }

    public int getArtista() {
        return Artista;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public int getCant_min_espectadores() {
        return Cant_min_espectadores;
    }

    public int getCant_max_espectadores() {
        return Cant_max_espectadores;
    }

    public String getUrl() {
        return Url;
    }

    public double getCosto() {
        return Costo;
    }

    public double getDuracion() {
        return Duracion;
    }

    public Date getFecha_Registro() {
        return Fecha_Registro;
    }

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public String getUrl_imagen() {
        return url_imagen;
    }

    public List<FuncionDTOConsultaEspectaculo> getFunciones() {
        return funciones;
    }

    public List<Paquete> getPaquetes() {
        return paquetes;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setArtista(int Artista) {
        this.Artista = Artista;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public void setCant_min_espectadores(int Cant_min_espectadores) {
        this.Cant_min_espectadores = Cant_min_espectadores;
    }

    public void setCant_max_espectadores(int Cant_max_espectadores) {
        this.Cant_max_espectadores = Cant_max_espectadores;
    }

    public void setUrl(String Url) {
        this.Url = Url;
    }

    public void setCosto(double Costo) {
        this.Costo = Costo;
    }

    public void setDuracion(double Duracion) {
        this.Duracion = Duracion;
    }

    public void setFecha_Registro(Date Fecha_Registro) {
        this.Fecha_Registro = Fecha_Registro;
    }

    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }

    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }

    public void setFunciones(List<FuncionDTOConsultaEspectaculo> funciones) {
        this.funciones = funciones;
    }

    public void setPaquetes(List<Paquete> paquetes) {
        this.paquetes = paquetes;
    }

    
    
    

}