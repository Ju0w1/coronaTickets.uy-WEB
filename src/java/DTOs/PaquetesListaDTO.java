/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import Logica.Clases.Paquete;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PaquetesListaDTO implements Serializable {
       private List<Paquete> paquetes;

    public PaquetesListaDTO(List<Paquete> paquetes) {
        this.paquetes = paquetes;
    }
    
        public PaquetesListaDTO() {

    }

    public List<Paquete> getPaquetes() {
        return paquetes;
    }

    public void setPaquetes(List<Paquete> paquetes) {
        this.paquetes = paquetes;
    }
       
}
