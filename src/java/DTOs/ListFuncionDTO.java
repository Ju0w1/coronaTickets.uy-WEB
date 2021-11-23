/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author milto
 */
public class ListFuncionDTO implements Serializable{
    private List<FuncionDTO> funciones;

    public ListFuncionDTO() {
    }

    public ListFuncionDTO(List<FuncionDTO> funciones) {
        this.funciones = funciones;
    }

    public List<FuncionDTO> getFunciones() {
        return funciones;
    }

    public void setFunciones(List<FuncionDTO> funciones) {
        this.funciones = funciones;
    }
    
}