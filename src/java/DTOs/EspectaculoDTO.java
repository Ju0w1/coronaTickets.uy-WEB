/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import Logica.Clases.Categoria;
import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 *
 * @author pabli
 */
public class EspectaculoDTO implements Serializable {
    @NotNull
    private String Nombre;
    private int Artista;
    private String Descripcion;
    private int Cant_min_espectadores;
    private int Cant_max_espectadores;
    private String Url;
    private double Costo;
    private double Duracion;
    private Date Fecha_Registro;
    private Map<String, Categoria> categorias;
    
    @Null
    private String url_imagen;
    private String plataforma;
    private String estado;

    public EspectaculoDTO() {
    }

    public EspectaculoDTO(String Nombre) {
        this.Nombre = Nombre;
    }
    
    
    
    //Getters
    public String getNombre(){
        return this.Nombre;
    }
    public int getArtista(){
        return this.Artista;
    }
    public String getDescripcion(){
        return this.Descripcion;
    }
    public int getMax(){
        return this.Cant_max_espectadores;
    }
    public int getMin(){
        return this.Cant_min_espectadores;
    }
    public String getUrl(){
        return this.Url;
    }
    public double getCosto(){
        return this.Costo;
    }
    public double getDuracion(){
        return this.Duracion;
    }
    public Date getFecha(){
        return this.Fecha_Registro;
    }
    public String getPlataforma(){
        return this.plataforma;
    }
    public String getEstado (){
        return this.estado;
    }
    public Map<String, Categoria> getCategorias(){
        return this.categorias;
    }
    public String getUrlIamgen (){
        return this.url_imagen;
    }
    

    //Setters
    public void setNombre(String nom_x){
        this.Nombre=nom_x;
    }
    public void setArtista(int artista_x){
        this.Artista=artista_x;
    }
    public void setDescripcion(String desc_x){
        this.Descripcion=desc_x;
    }
    public void setMax(int max_x){
        this.Cant_max_espectadores=max_x;
    }
    public void setMin(int min_x){
        this.Cant_min_espectadores=min_x;
    }
    public void setUrl(String url_x){
        this.Url=url_x;
    }
    public void setCosto(int costo_x){
        this.Costo=costo_x;
    }
    public void setFecha(Date fecha){
        this.Fecha_Registro=fecha;
    }
        public void setEstado (String estado){
        this.estado=estado;
    }
    public void setPlataforma (String plataforma){
        this.plataforma=plataforma;
    }
    public void setCategoria (Map<String, Categoria> categorias){
        this.categorias=categorias;
    }
    public void setUrlImagen (String urlImagen){
        this.url_imagen=urlImagen;
    }
    
}
