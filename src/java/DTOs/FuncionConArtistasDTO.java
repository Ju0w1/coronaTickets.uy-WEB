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
public class FuncionConArtistasDTO implements Serializable{
    private FuncionDTO funcion;
    private ArtistasDeFuncionDTO artistas;

    public FuncionConArtistasDTO() {
    }

    public FuncionConArtistasDTO(FuncionDTO funcion, ArtistasDeFuncionDTO artistas) {
        this.funcion = funcion;
        this.artistas = artistas;
    }

    public FuncionDTO getFuncion() {
        return funcion;
    }

    public ArtistasDeFuncionDTO getArtistas() {
        return artistas;
    }

    public void setFuncion(FuncionDTO funcion) {
        this.funcion = funcion;
    }

    public void setArtistas(ArtistasDeFuncionDTO artistas) {
        this.artistas = artistas;
    }
    
    
}
