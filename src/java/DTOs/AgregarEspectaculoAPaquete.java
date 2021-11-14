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

public class AgregarEspectaculoAPaquete implements Serializable {
    private String Nombre;
    private int Artista;
    private String Descripcion;
    private int Cant_min_espectadores;
    private int Cant_max_espectadores;
    private String Url;
    private double Costo;
    private double Duracion;
    private Date Fecha_Registro;
    private List<Categoria> categorias;
    private String url_imagen;
    private List<FuncionDTOConsultaEspectaculo> funciones;
    private List<Paquete> paquetes;
    
    public AgregarEspectaculoAPaquete(){
        
    }
    
  
    
    

}