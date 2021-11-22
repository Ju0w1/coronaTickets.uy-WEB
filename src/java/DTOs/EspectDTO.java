/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;
import java.util.List;
/**
 *
 * @author milto
 */
public class EspectDTO implements Serializable{
    private String Nombre;
    private String url_imagen;
    private String plataforma;
    private List<CategoriaDTO> categorias;
    

    public EspectDTO() {
    }

    public EspectDTO(String Nombre) {
        this.Nombre = Nombre;
    }

    public EspectDTO(String Nombre, String url_imagen, String plataforma) {
        this.Nombre = Nombre;
        this.url_imagen = url_imagen;
        this.plataforma = plataforma;
    }

    public EspectDTO(String Nombre, String plataforma, String url_imagen, List<CategoriaDTO> categorias) {
        this.Nombre = Nombre;
        this.categorias = categorias;
        this.url_imagen = url_imagen;
        this.plataforma = plataforma;
    }
    
    
    
    
    //Getters
    public String getNombre(){
        return this.Nombre;
    }
    public String getPlataforma(){
        return this.plataforma;
    }

    public List<CategoriaDTO> getCategorias(){
        return this.categorias;
    }
    public String getUrlIamgen (){
        return this.url_imagen;
    }
    

    //Setters
    public void setNombre(String nom_x){
        this.Nombre=nom_x;
    }
    
    public void setCategoria (List<CategoriaDTO> categorias){
        this.categorias=categorias;
    }
    public void setUrlImagen (String urlImagen){
        this.url_imagen=urlImagen;
    }
}
