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
public class PaquetesDeUserDTO {
    private String nombre;
    private String descuento;

    public PaquetesDeUserDTO() {
    }

    public PaquetesDeUserDTO(String nombre, String descuento) {
        this.nombre = nombre;
        this.descuento = descuento;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescuento() {
        return descuento;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }
    
    
}
