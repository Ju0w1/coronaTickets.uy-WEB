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
public class DTOespec implements Serializable{
    private String Nombre;
    private String plataforma;
    private String imagen;
    private List<CategoriaDTO> categorias;
    
    public DTOespec() {
    }

    public DTOespec(String Nombre, String plataforma, String imagen, List<CategoriaDTO> categorias) {
        this.Nombre = Nombre;
        this.plataforma = plataforma;
        this.imagen = imagen;
        this.categorias = categorias;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public String getImagen() {
        return imagen;
    }

    public List<CategoriaDTO> getCategorias() {
        return categorias;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public void setCategorias(List<CategoriaDTO> categorias) {
        this.categorias = categorias;
    }

    
    
}