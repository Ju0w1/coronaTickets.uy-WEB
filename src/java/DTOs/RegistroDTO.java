/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;
import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
/**
 *
 * @author milto
 */
public class RegistroDTO implements Serializable{
    private String biografia;
    private String descripcion;
    private String link;
    
    @NotNull
    private String nickname;
    private String nombre;
    private String apellido;
    private String pass;
    private Date fecha;
    private String email;
    private String imagen;

    public RegistroDTO(String biografia, String descripcion, String link, String nickname, String nombre, String apellido, String pass,Date fecha, String email, String imagen) {
        this.biografia = biografia;
        this.descripcion = descripcion;
        this.link = link;
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.pass = pass;
        this.fecha = fecha;
        this.email = email;
        this.imagen = imagen;
    }
    
    public RegistroDTO(String nickname, String nombre, String apellido, String pass,Date fecha, String email, String imagen) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.pass = pass;
        this.fecha = fecha;
        this.email = email;
        this.imagen = imagen;
    }
    
    public RegistroDTO(){
        
    }

    //GETTERS
    public String getBiografia() {
        return biografia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getLink() {
        return link;
    }

    public String getNickname() {
        return nickname;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getPass() {
        return pass;
    }

    public Date getFecha() {
        return fecha;
    }

    public String getEmail() {
        return email;
    }

    public String getImagen() {
        return imagen;
    }
    
    //SETTERS
    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
}
