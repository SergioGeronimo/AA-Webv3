/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ezpadaz.web;

import com.ezpadaz.sec.Crypto;
import java.io.Serializable;

/**
 *
 * @author dev
 */
public class Usuario implements Serializable{
    
    private String email;
    private String nombre;
    private String password;
    private String ssid;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        System.out.println(email);
        this.email = email;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String pwd) {
        this.password = Crypto.getSHA(pwd);
    }

    public String getSsid() {
        return ssid;
    }

    public void setSsid(String ssid) {
        this.ssid = ssid;
    }    
}
