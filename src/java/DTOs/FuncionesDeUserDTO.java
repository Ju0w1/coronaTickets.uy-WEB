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
public class FuncionesDeUserDTO {
    private String nombre;
    private String espectaculo;
    private String plataforma;

    //CONSRUCTOR
    public FuncionesDeUserDTO(String nombre, String espectaculo, String plataforma) {
        this.nombre = nombre;
        this.espectaculo = espectaculo;
        this.plataforma = plataforma;
    }
    public FuncionesDeUserDTO(){
    }

    //GETTERS
    public String getNombre() {
        return nombre;
    }

    public String getEspectaculo() {
        return espectaculo;
    }

    public String getPlataforma() {
        return plataforma;
    }
    
    //SETTERS
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEspectaculo(String espectaculo) {
        this.espectaculo = espectaculo;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }
    
}
