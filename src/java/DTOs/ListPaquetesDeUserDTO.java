/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.util.List;

/**
 *
 * @author milto
 */
public class ListPaquetesDeUserDTO {
    private List<PaquetesDeUserDTO> paquetes;
    
    public ListPaquetesDeUserDTO(List<PaquetesDeUserDTO> paquetes) {
        this.paquetes = paquetes;
    }
    
    public ListPaquetesDeUserDTO() {
    }
    
    public List<PaquetesDeUserDTO> getPaquetes() {
        return paquetes;
    }

    public void setPaquetes(List<PaquetesDeUserDTO> paquetes) {
        this.paquetes = paquetes;
    }
    
}