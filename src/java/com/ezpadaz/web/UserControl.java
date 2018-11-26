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
        Statement st;
        ResultSet rs;   
        System.out.println(mapa.size());
        try {
                    userControlConnection = data.obtenerConexion();
                    st = userControlConnection.createStatement();
                    rs = st.executeQuery("SELECT contraseña FROM aire_acondicionado.usuarios WHERE email='"+user.getEmail()+"';");
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
    
     public static boolean checkDuplicates(String email){
         boolean ret = false;
         Statement st;
         ResultSet rs; 
         try{
              userControlConnection = data.obtenerConexion();
              st = userControlConnection.createStatement();
              rs = st.executeQuery("SELECT email FROM aire_acondicionado.usuarios WHERE email='"+email+"';");
              if(rs==null){
                        System.out.println("Something happened UC-L65");
                    } else {
                        while(rs.next()){
                            if(rs.getString(1).equals(email)) {
                                //System.out.println(rs.getString(1));
                                ret = true;
                            }else{
                            }
                        }
                    }
          }catch(Exception e){
              e.printStackTrace();
          }
         return ret;
     }
    
      public static void register(String email, String pwd, String name){      
          Statement st;
          ResultSet rs;   
          String values = "('"+email+"','"+pwd+"','"+name+"')";
          String sql = "INSERT INTO aire_acondicionado.usuarios VALUES"+values;
          //INSERT INTO `usuarios`(`email`, `contraseña`, `nombre`) VALUES ([value-1],[value-2],[value-3])
          
          try{
              userControlConnection = data.obtenerConexion();
              st = userControlConnection.createStatement();
              st.executeUpdate(sql);
          }catch(Exception e){
              
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
