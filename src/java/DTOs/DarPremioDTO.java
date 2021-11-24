/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author pabli
 */
public class DarPremioDTO implements Serializable{
    private String nickname;
    private String nomFuncion;

    public DarPremioDTO() {
    }

    public DarPremioDTO(String nickname, String nomFuncion) {
        this.nickname = nickname;
        this.nomFuncion = nomFuncion;
    }

    public String getNickname() {
        return nickname;
    }

    public String getNomFuncion() {
        return nomFuncion;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setNomFuncion(String nomFuncion) {
        this.nomFuncion = nomFuncion;
    }
    
    
}
