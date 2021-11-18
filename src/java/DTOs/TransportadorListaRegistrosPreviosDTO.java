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
public class TransportadorListaRegistrosPreviosDTO implements Serializable{
    private List<RegistrosPreviosDTO> registros;

    public TransportadorListaRegistrosPreviosDTO() {
    }

    public TransportadorListaRegistrosPreviosDTO(List<RegistrosPreviosDTO> registros) {
        this.registros = registros;
    }

    public List<RegistrosPreviosDTO> getRegistros() {
        return registros;
    }

    public void setRegistros(List<RegistrosPreviosDTO> registros) {
        this.registros = registros;
    }
    
    
}
