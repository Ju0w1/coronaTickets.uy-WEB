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
public class followDTO {
    private String Yo;
    private String el;

    public followDTO() {
    }

    public followDTO(String Yo, String el) {
        this.Yo = Yo;
        this.el = el;
    }

    public String getYo() {
        return Yo;
    }

    public String getEl() {
        return el;
    }

    public void setYo(String Yo) {
        this.Yo = Yo;
    }

    public void setEl(String el) {
        this.el = el;
    }
    
}
