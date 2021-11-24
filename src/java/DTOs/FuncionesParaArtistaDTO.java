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
public class FuncionesParaArtistaDTO implements Serializable{
    private String nombreF;
    private String imagen;

    public FuncionesParaArtistaDTO(String nombreF, String imagen) {
        this.nombreF = nombreF;
        this.imagen = imagen;
    }

    public FuncionesParaArtistaDTO() {
    }

    public String getNombreF() {
        return nombreF;
    }

    public String getImagen() {
        return imagen;
    }

    public void setNombreF(String nombreF) {
        this.nombreF = nombreF;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
}
