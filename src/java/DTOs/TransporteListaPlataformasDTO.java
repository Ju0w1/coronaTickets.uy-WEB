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
public class TransporteListaPlataformasDTO implements Serializable{
    private List<String> plataformas;

    public TransporteListaPlataformasDTO(List<String> plataformas) {
        this.plataformas = plataformas;
    }

    public TransporteListaPlataformasDTO() {
    }

    public List<String> getPlataformas() {
        return plataformas;
    }

    public void setPlataformas(List<String> plataformas) {
        this.plataformas = plataformas;
    }
    
}
