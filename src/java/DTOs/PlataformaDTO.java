/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import Logica.Clases.Plataforma;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author diete
 */
public class PlataformaDTO implements Serializable{

       private List<Plataforma> plataformas;

    public PlataformaDTO(List<Plataforma> plataformas) {
        this.plataformas = plataformas;
    }

    public List<Plataforma> getPlataformas() {
        return plataformas;
    }

    public void setPlataformas(List<Plataforma> plataformas) {
        this.plataformas = plataformas;
    }
    
    public PlataformaDTO() {
    }
       
}
