/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import javax.validation.constraints.NotNull;

/**
 *
 * @author facun
 */
public class CompraPaqueteDTO {
    @NotNull
    String nicknameUsuario;
    String nombrePaquete;
    
    public CompraPaqueteDTO (String nickname, String nombrePaquete){
        this.nicknameUsuario=nickname;
        this.nombrePaquete=nombrePaquete;
    }
    
    //Getters
    public String getNick(){
        return this.nicknameUsuario;
    }
    public String getPaquete(){
        return this.nombrePaquete;
    }
    
    //Setters
    public void setNick(String nickname){
        this.nicknameUsuario=nickname;
    }
    public void setPaquete(String nombrePaquete){
        this.nombrePaquete=nombrePaquete;
    }
}
