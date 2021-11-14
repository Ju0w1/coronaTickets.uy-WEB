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
    private String bio;
    private String desc;
    private String link;

    public UserDTO(String nickname, String nombre, String apellido, String email, Date nacimiento, String url_imagen, String tipo, int seguidores, int seguidos) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nacimiento = nacimiento;
        this.url_imagen = url_imagen;
        this.tipo = tipo;
        this.seguidores = seguidores;
        this.seguidos = seguidos;
    }
    public UserDTO(String nickname, String nombre, String apellido, String email, Date nacimiento, String url_imagen, String desc, String bio, String link, String tipo, int seguidores, int seguidos) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nacimiento = nacimiento;
        this.url_imagen = url_imagen;
        this.tipo = tipo;
        this.desc= desc;
        this.bio = bio;
        this.link = link;
        this.seguidores = seguidores;
        this.seguidos = seguidos;
    }
    
    public UserDTO(){
        
    }
    
    public UserDTO(String nickname, String nombre, String apellido, String email, Date nacimiento) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nacimiento = nacimiento;
    }
    public UserDTO(String nickname, String nombre, String apellido, String email, Date nacimiento, String tipo) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nacimiento = nacimiento;
        this.tipo = tipo;
    }
    public UserDTO(String nick){
        this.nickname = nick;
    }
    public UserDTO(String nickname, String nombre, String apellido, String email, Date nacimiento, String imagen, String descripcion, String biografia, String url) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nacimiento = nacimiento;
        this.url_imagen = imagen;
        this.desc = descripcion;
        this.bio = biografia;
        this.link = url;
    }
     
    public UserDTO(String nick, String imagen){
        this.nickname = nick;
        this.url_imagen = imagen;
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
    public String getBio() {
        return bio;
    }
    public String getDesc() {
        return desc;
    }
    public String getLink() {
        return link;
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
    public void setBio(String bio) {
        this.bio = bio;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public void setLink(String link) {
        this.link = link;
    }
}
