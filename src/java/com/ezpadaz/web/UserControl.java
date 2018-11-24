/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ezpadaz.web;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author dev
 */
public class UserControl {
    
    private static DBPool data = DBPool.obtenerInstancia();
    private static Connection userControlConnection;
    private static ConcurrentHashMap<String, Usuario> mapa =  new ConcurrentHashMap<String, Usuario>();
    
    private UserControl(){
        //NO INSTANCIAS.
    }
    
    public static void login(String ssid, Usuario user){
        userControlConnection = data.obtenerConexion();
        Statement st;
        ResultSet rs;   
        System.out.println(mapa.size());
        try {
                    st = userControlConnection.createStatement();
                    rs = st.executeQuery("SELECT contraseña FROM AireAcondicionado.usuarios WHERE email='"+user.getEmail()+"';");
                    if(rs==null){
                        System.out.println("No se encontro el usuario con email "+user.getEmail());
                    } else {
                        while(rs.next()){
                            if(rs.getString(1).equals(user.getPassword())) {
                                mapa.put(ssid, user);
                            }  
                        }
                    }
                }catch(SQLException sx){
                    sx.printStackTrace();
                } finally {
                    try{
                        userControlConnection.close();
                    }catch(Exception e){
                        e.printStackTrace();
                    }
    }
        
    }
    
    public static void logout(String ssid){
         mapa.remove(ssid);
    }
    
    public static boolean isLogged(String ssid){
        //Retorna si el usuario ya se encuentra en el CHM
        return mapa.containsKey(ssid);
    }
    
    public static String usuariosOnline(){
      return Integer.toString(mapa.size());
    }
}
