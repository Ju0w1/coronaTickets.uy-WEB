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

public class FuncionDTO implements Serializable {

        private String nombre;
        private Date fecha;
        private Time horaInicio;
        private Date fechaRegistro;
        private Espectaculo espectaculo;
        private Map<String, Artista> artistas;

        private String urlImagen;
        
        //CONSRUCTOR
        public FuncionDTO (String nombre, Date fecha, Time horaInicio, Date fechaRegistro, Espectaculo espectaculo, Map<String, Artista> artistas, String urlImagen){
            this.nombre= nombre;
            this.fecha= fecha;
            this.horaInicio= horaInicio;
            this.fechaRegistro= fechaRegistro;
            this.espectaculo=espectaculo;
            this.artistas=artistas;
            this.urlImagen=urlImagen;
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
        
        public Map<String, Artista> getArtistas(){
            return this.artistas;
        }
        
        public Espectaculo getEspectaculo(){
            return this.espectaculo;
        }
        
        public String getUrlIamgen (){
            return this.urlImagen;
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
        
        public void setArtistas(Map<String, Artista> artistas){
            this.artistas=artistas;
        }
        
        public void setUrlImagen (String urlImagen){
            this.urlImagen=urlImagen;
        }
}
