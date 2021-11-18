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
public class TransporteListaPaquetesHomeDTO implements Serializable{
    private List<HomePaqueteDTO> paquetes;

    public TransporteListaPaquetesHomeDTO() {
    }

    public TransporteListaPaquetesHomeDTO(List<HomePaqueteDTO> paquetes) {
        this.paquetes = paquetes;
    }

    public List<HomePaqueteDTO> getPaquetes() {
        return paquetes;
    }

    public void setPaquetes(List<HomePaqueteDTO> paquetes) {
        this.paquetes = paquetes;
    }
    
    
}
