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
public class RegistroFuncionDTO implements Serializable{
    private String user;
    private String funcion;

    public RegistroFuncionDTO() {
    }

    public RegistroFuncionDTO(String user, String funcion) {
        this.user = user;
        this.funcion = funcion;
    }

    public String getUser() {
        return user;
    }

    public String getFuncion() {
        return funcion;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setFuncion(String funcion) {
        this.funcion = funcion;
    }
    
    
}
