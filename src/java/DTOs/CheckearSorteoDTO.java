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
public class CheckearSorteoDTO implements Serializable{
    private String nombreArtista;
    private String nombreFuncion;

    public CheckearSorteoDTO() {
    }

    public CheckearSorteoDTO(String nombreArtista, String nombreFuncion) {
        this.nombreArtista = nombreArtista;
        this.nombreFuncion = nombreFuncion;
    }

    public String getNombreArtista() {
        return nombreArtista;
    }

    public String getNombreFuncion() {
        return nombreFuncion;
    }

    public void setNombreArtista(String nombreArtista) {
        this.nombreArtista = nombreArtista;
    }

    public void setNombreFuncion(String nombreFuncion) {
        this.nombreFuncion = nombreFuncion;
    }
    
    
}
