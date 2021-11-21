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
public class ListTrophyDTO {
    private List<TrophyDTO> premios;

    public ListTrophyDTO(List<TrophyDTO> premios) {
        this.premios = premios;
    }

    public ListTrophyDTO() {
    }

    public List<TrophyDTO> getPremios() {
        return premios;
    }

    public void setPremios(List<TrophyDTO> premios) {
        this.premios = premios;
    }
    
    
}
