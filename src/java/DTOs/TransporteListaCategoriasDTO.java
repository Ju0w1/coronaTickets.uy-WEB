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
public class TransporteListaCategoriasDTO implements Serializable{
    private List<String> categorias;

    public TransporteListaCategoriasDTO() {
    }

    public TransporteListaCategoriasDTO(List<String> categorias) {
        this.categorias = categorias;
    }

    public List<String> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<String> categorias) {
        this.categorias = categorias;
    }
    
}
