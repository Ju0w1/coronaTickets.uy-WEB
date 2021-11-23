/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class FavoritoDTO implements Serializable{
    private String userNickname;
    private String especNombre;

    public FavoritoDTO(String userNickname, String especNombre) {
        this.userNickname = userNickname;
        this.especNombre = especNombre;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public String getEspecNombre() {
        return especNombre;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public void setEspecNombre(String especNombre) {
        this.especNombre = especNombre;
    }

    public FavoritoDTO() {
    }
    
}
