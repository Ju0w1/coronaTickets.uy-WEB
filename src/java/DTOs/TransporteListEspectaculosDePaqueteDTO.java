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
public class TransporteListEspectaculosDePaqueteDTO implements Serializable{
    private List<EspectaculoPaqueteDTO> espectaculos;

    public TransporteListEspectaculosDePaqueteDTO() {
    }

    public TransporteListEspectaculosDePaqueteDTO(List<EspectaculoPaqueteDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public List<EspectaculoPaqueteDTO> getEspectaculos() {
        return espectaculos;
    }

    public void setEspectaculos(List<EspectaculoPaqueteDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }
    
    
}
