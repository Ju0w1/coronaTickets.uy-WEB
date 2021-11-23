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
 * @author milto
 */
public class DTOListEspec implements Serializable{
    private List<DTOespec> espectaculos;

    public DTOListEspec() {
    }

    public DTOListEspec(List<DTOespec> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public List<DTOespec> getEspectaculos() {
        return espectaculos;
    }

    public void setEspectaculos(List<DTOespec> espectaculos) {
        this.espectaculos = espectaculos;
    }
    
    
}