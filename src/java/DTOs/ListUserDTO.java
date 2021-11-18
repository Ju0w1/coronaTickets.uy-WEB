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
public class ListUserDTO {
    private List<UserDTO> usuarios;

    public ListUserDTO() {
    }

    public ListUserDTO(List<UserDTO> usuarios) {
        this.usuarios = usuarios;
    }

    public List<UserDTO> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(List<UserDTO> usuarios) {
        this.usuarios = usuarios;
    }
    
}
