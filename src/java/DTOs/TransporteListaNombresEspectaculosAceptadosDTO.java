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
public class TransporteListaNombresEspectaculosAceptadosDTO implements Serializable{
    private List<String> espectaculos;

    public TransporteListaNombresEspectaculosAceptadosDTO(List<String> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public TransporteListaNombresEspectaculosAceptadosDTO() {
    }
    
    public List<String> getEspectaculos() {
        return espectaculos;
    }

    public void setEspectaculos(List<String> espectaculos) {
        this.espectaculos = espectaculos;
    }
    
    
}
