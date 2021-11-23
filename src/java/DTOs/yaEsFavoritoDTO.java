/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class yaEsFavoritoDTO implements Serializable{

    private boolean esFavorito;

    public yaEsFavoritoDTO() {
    }

    public yaEsFavoritoDTO(boolean esFavorito) {
        this.esFavorito = esFavorito;
    }

    public boolean isEsFavorito() {
        return esFavorito;
    }

    public void setEsFavorito(boolean esFavorito) {
        this.esFavorito = esFavorito;
    }

}
