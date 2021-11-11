/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.io.Serializable;

/**
 *
 * @author pabli
 */
public class LoginDTO implements Serializable {
    private String user;
    private String passwd;
    
    void setUser(String user){
        this.user = user;
    }
    void setPasswd(String passwd){
        this.passwd = passwd;
    }

    public String getUser() {
        return user;
    }

    public String getPasswd() {
        return passwd;
    }
    public LoginDTO(String user, String passwd) {
        this.user = user;
        this.passwd = passwd;
    }
    public LoginDTO() {
        
    }

}
