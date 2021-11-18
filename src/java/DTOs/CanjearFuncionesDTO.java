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
public class CanjearFuncionesDTO implements Serializable{
    private String user;
    private String funcionAAgregar;
    private String funcion1;
    private String funcion2;
    private String funcion3;

    public CanjearFuncionesDTO() {
    }

    public CanjearFuncionesDTO(String user, String funcionAAgregar, String funcion1, String funcion2, String funcion3) {
        this.user = user;
        this.funcionAAgregar = funcionAAgregar;
        this.funcion1 = funcion1;
        this.funcion2 = funcion2;
        this.funcion3 = funcion3;
    }

    public String getUser() {
        return user;
    }

    public String getFuncionAAgregar() {
        return funcionAAgregar;
    }

    public String getFuncion1() {
        return funcion1;
    }

    public String getFuncion2() {
        return funcion2;
    }

    public String getFuncion3() {
        return funcion3;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setFuncionAAgregar(String funcionAAgregar) {
        this.funcionAAgregar = funcionAAgregar;
    }

    public void setFuncion1(String funcion1) {
        this.funcion1 = funcion1;
    }

    public void setFuncion2(String funcion2) {
        this.funcion2 = funcion2;
    }

    public void setFuncion3(String funcion3) {
        this.funcion3 = funcion3;
    }
    
    
    
}
