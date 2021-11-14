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
public class SeguirUsuarioDTO implements Serializable{
    private String nickASeguir;
    private String nickSeguidor;

    public SeguirUsuarioDTO(String nickASeguir, String nickSeguidor) {
        this.nickASeguir = nickASeguir;
        this.nickSeguidor = nickSeguidor;
    }

    public SeguirUsuarioDTO() {
    }
    
    
    public String getNickASeguir() {
        return nickASeguir;
    }

    public String getNickSeguidor() {
        return nickSeguidor;
    }

    public void setNickASeguir(String nickASeguir) {
        this.nickASeguir = nickASeguir;
    }

    public void setNickSeguidor(String nickSeguidor) {
        this.nickSeguidor = nickSeguidor;
    }
    
}
