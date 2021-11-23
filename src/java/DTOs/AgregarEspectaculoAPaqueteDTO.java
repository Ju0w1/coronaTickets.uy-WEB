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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 *
 * @author Feder
 */

public class AgregarEspectaculoAPaqueteDTO implements Serializable {
    private ArrayList<String> espectaculos = new ArrayList();
    private String paquete;
    private String espectaculo;
    public AgregarEspectaculoAPaqueteDTO(){
        
    }

    public void setEspectaculos(ArrayList<String> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public ArrayList<String> getEspectaculos() {
        return espectaculos;
    }

    public AgregarEspectaculoAPaqueteDTO(ArrayList<String> espectaculos) {
        this.espectaculos = espectaculos;
    }

    public String getPaquete() {
        return paquete;
    }

    public String getEspectaculo() {
        return espectaculo;
    }

    public void setPaquete(String paquete) {
        this.paquete = paquete;
    }

    public void setEspectaculo(String espectaculo) {
        this.espectaculo = espectaculo;
    }

    public AgregarEspectaculoAPaqueteDTO(String paquete, String espectaculo) {
        this.paquete = paquete;
        this.espectaculo = espectaculo;
    }
    
}