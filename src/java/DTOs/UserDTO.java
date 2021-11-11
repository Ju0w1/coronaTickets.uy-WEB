/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author pabli
 */
public class UserDTO implements Serializable {
    private String nickname;
    private String nombre;
    private String apellido;
    private String email;
    private Date nacimiento;
    private String url_imagen;
    private int seguidores;
    private int seguidos;
    private String tipo;

    public UserDTO(){
        
    }
    
    public UserDTO(String nickname, String nombre, String apellido, String email, Date nacimiento) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nacimiento = nacimiento;
    }
    
    
    
    //GETTERS
    public String getNickname() {
        return nickname;
    }
    public String getNombre() {
        return nombre;
    }
    public String getApellido() {
        return apellido;
    }
    public String getEmail() {
        return email;
    }
    public Date getNacimiento() {
        return nacimiento;
    }
    public String getUrl_imagen() {
        return url_imagen;
    }
    public int getSeguidores() {
        return seguidores;
    }
    public int getSeguidos() {
        return seguidos;
    }
    public String getTipo() {
        return tipo;
    }
    
    
    //SETTERS
    public void setTipo(String tipo) {
        this.tipo = tipo;
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
    public void setEmail(String email) {
        this.email = email;
    }
    public void setNacimiento(Date fechaNacimiento) {
        this.nacimiento = fechaNacimiento;
    }
    public void setUrl_imagen(String urlImagen) {
        this.url_imagen = urlImagen;
    }
    public void setSeguidores(int seguidores) {
        this.seguidores = seguidores;
    }
    public void setSeguidos(int seguidos) {
        this.seguidos = seguidos;
    }
}
