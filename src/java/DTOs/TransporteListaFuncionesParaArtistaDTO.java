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
 * @author pabli
 */
public class TransporteListaFuncionesParaArtistaDTO implements Serializable{
    private List<FuncionesParaArtistaDTO> funciones;

    public TransporteListaFuncionesParaArtistaDTO(List<FuncionesParaArtistaDTO> funciones) {
        this.funciones = funciones;
    }

    public TransporteListaFuncionesParaArtistaDTO() {
    }
    
    public List<FuncionesParaArtistaDTO> getFunciones() {
        return funciones;
    }

    public void setFunciones(List<FuncionesParaArtistaDTO> funciones) {
        this.funciones = funciones;
    }
    
    
}
