/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author Davila
 */
public class DejarDeSeguirUsuarioDTO implements Serializable{
    private String nickADejar;
    private String nickseguidor;

    public DejarDeSeguirUsuarioDTO(String nickADejar, String nickseguidor) {
        this.nickADejar = nickADejar;
        this.nickseguidor = nickseguidor;
    }

    public DejarDeSeguirUsuarioDTO() {
    }

    
    public String getNickADejar() {
        return nickADejar;
    }

    public String getNickseguidor() {
        return nickseguidor;
    }

    public void setNickADejar(String nickADejar) {
        this.nickADejar = nickADejar;
    }

    public void setNickseguidor(String nickseguidor) {
        this.nickseguidor = nickseguidor;
    }
    
    
    
}
