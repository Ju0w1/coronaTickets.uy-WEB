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
public class TransporteListaEspecFinalizadosDTO implements Serializable{
    private List<EspecFinalizadoDTO> espectaculos;

    public TransporteListaEspecFinalizadosDTO() {
    }

    public TransporteListaEspecFinalizadosDTO(List<EspecFinalizadoDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public List<EspecFinalizadoDTO> getEspectaculos() {
        return espectaculos;
    }

    public void setEspectaculos(List<EspecFinalizadoDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }
    
    
}
