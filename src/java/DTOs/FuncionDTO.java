/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import Logica.Clases.Artista;
import Logica.Clases.Espectaculo;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.Map;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

/**
 *
 * @author facun
 */
public class FuncionDTO implements Serializable {

        private String nombre;
        private Date fecha;
        private Time horaInicio;
        private Date fechaRegistro;
        private String urlImagen;
        private String nombreEspectaculo;
        
        //CONSRUCTOR
        public FuncionDTO (String nombre, Date fecha, Time horaInicio, Date fechaRegistro,String urlImagen, String nombreEspectaculo){
            this.nombre= nombre;
            this.fecha= fecha;
            this.horaInicio= horaInicio;
            this.fechaRegistro= fechaRegistro;
            this.urlImagen=urlImagen;
            this.nombreEspectaculo=nombreEspectaculo;
        }
        
        public FuncionDTO() {
        }
        //GETTERS
        public String getNombre(){
            return this.nombre;
        }

        
        public Date getFecha(){
            return this.fecha;
        }
        
        public Time getHoraInicio(){
            return this.horaInicio;
        }
        
        public Date getFechaRegistro(){
            return this.fechaRegistro;
        }

        public String getNombreEspectaculo() {
            return nombreEspectaculo;
        }

        public String getUrlImagen() {
            return urlImagen;
        }

    public void setNombreEspectaculo(String nombreEspectaculo) {
        this.nombreEspectaculo = nombreEspectaculo;
    }

        

        
        //SETTERS
        public void setNombre(String nombre_){
            this.nombre=nombre_;
        }
        
        public void setFecha(Date fecha_){
            this.fecha= fecha_;
        }
        
        public void setHoraInicio(Time horaInicio_){
            this.horaInicio= horaInicio_;
        }
        
        public void setFechaRegistro(Date fechaRegistro_){
            this.fechaRegistro=fechaRegistro_;
        }
        
        
        public void setUrlImagen (String urlImagen){
            this.urlImagen=urlImagen;
        }
}
