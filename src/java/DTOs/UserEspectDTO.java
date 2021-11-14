/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

/**
 *
 * @author milto
 */
public class UserEspectDTO {
    private String nombre;
    private String plataforma;
    private String costo;

    public UserEspectDTO(String nombre, String plataforma, String costo) {
        this.nombre = nombre;
        this.plataforma = plataforma;
        this.costo = costo;
    }

    public UserEspectDTO() {
    }

    public String getNombre() {
        return nombre;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public String getCosto() {
        return costo;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }
    
}
