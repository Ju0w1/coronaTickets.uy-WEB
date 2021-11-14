package DTOs;


import DTOs.UserEspectDTO;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author milto
 */
public class ListUserEspectDTO {
    private List<UserEspectDTO> espectaculos;

    public ListUserEspectDTO() {
    }

    public ListUserEspectDTO(List<UserEspectDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public List<UserEspectDTO> getEspectaculos() {
        return espectaculos;
    }

    public void setEspectaculos(List<UserEspectDTO> espectaculos) {
        this.espectaculos = espectaculos;
    }
    
}
