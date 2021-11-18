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
public class TransporteListaEspectaculosHomeDTO implements Serializable{
    private List<HomeEspectaculoDTO> espectaculos;

    public TransporteListaEspectaculosHomeDTO() {
    }

    public TransporteListaEspectaculosHomeDTO(List<HomeEspectaculoDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public List<HomeEspectaculoDTO> getEspectaculos() {
        return espectaculos;
    }

    public void setEspectaculos(List<HomeEspectaculoDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }
    
    
}
