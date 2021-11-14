/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import Logica.Clases.Categoria;
import Logica.Clases.Funcion;
import Logica.Clases.Paquete;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 *
 * @author Feder
 */

public class FuncionDTOConsultaEspectaculo implements Serializable {
    private String Nombre;
    private String url_imagen;

    public FuncionDTOConsultaEspectaculo(){
        
    }

    public FuncionDTOConsultaEspectaculo(String Nombre, String url_imagen) {
        this.Nombre = Nombre;
        this.url_imagen = url_imagen;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getUrl_imagen() {
        return url_imagen;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }
    
    

}