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
public class ListFuncionesDeUserDTO {
    private List<FuncionesDeUserDTO> funciones;

    public ListFuncionesDeUserDTO(List<FuncionesDeUserDTO> funciones) {
        this.funciones = funciones;
    }
    public ListFuncionesDeUserDTO() {
    }

    public List<FuncionesDeUserDTO> getFunciones() {
        return funciones;
    }

    public void setFunciones(List<FuncionesDeUserDTO> funciones) {
        this.funciones = funciones;
    }

}
