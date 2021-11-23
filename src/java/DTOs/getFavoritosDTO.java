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
public class getFavoritosDTO implements Serializable {
    int cantidadFavoritos;

    public getFavoritosDTO() {
    }

    public getFavoritosDTO(int cantidadFavoritos) {
        this.cantidadFavoritos = cantidadFavoritos;
    }

    public int getCantidadFavoritos() {
        return cantidadFavoritos;
    }

    public void setCantidadFavoritos(int cantidadFavoritos) {
        this.cantidadFavoritos = cantidadFavoritos;
    }
    
    
}
