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
 * @author pabli
 */
public class TransporteListaArtistasDTO implements Serializable{
    private List<String> artistas;

    public TransporteListaArtistasDTO() {
    }

    public TransporteListaArtistasDTO(List<String> artistas) {
        this.artistas = artistas;
    }

    public List<String> getArtistas() {
        return artistas;
    }

    public void setArtistas(List<String> artistas) {
        this.artistas = artistas;
    }
    
     
}
