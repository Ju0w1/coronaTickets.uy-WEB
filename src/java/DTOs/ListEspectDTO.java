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
public class ListEspectDTO implements Serializable{
    private List<EspectDTO> espectaculos;

    public ListEspectDTO() {
    }

    public ListEspectDTO(List<EspectDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public List<EspectDTO> getEspectaculos() {
        return espectaculos;
    }

    public void setEspectaculos(List<EspectDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }
    
}