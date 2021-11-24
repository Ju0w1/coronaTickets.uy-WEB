/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author milto
 */
public class funcionDTOSimple implements Serializable{
    private String nombreFuncion;

    public funcionDTOSimple() {
    }

    public funcionDTOSimple(String nombreFuncion) {
        this.nombreFuncion = nombreFuncion;
    }

    public String getNombreFuncion() {
        return nombreFuncion;
    }

    public void setNombreFuncion(String nombreFuncion) {
        this.nombreFuncion = nombreFuncion;
    }
}
