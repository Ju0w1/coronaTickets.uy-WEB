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
public class TransporteListaPaquetesRegistroDTO implements Serializable{
    private List<PaqueteRegistroDTO> registros;

    public TransporteListaPaquetesRegistroDTO() {
    }

    public TransporteListaPaquetesRegistroDTO(List<PaqueteRegistroDTO> registros) {
        this.registros = registros;
    }

    public List<PaqueteRegistroDTO> getRegistros() {
        return registros;
    }

    public void setRegistros(List<PaqueteRegistroDTO> registros) {
        this.registros = registros;
    }
    
    
}
