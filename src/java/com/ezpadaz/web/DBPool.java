/*
    Esto no se usa en ningun lado aun.
    Pero se usara si se necesita.
*/
package com.ezpadaz.web;

/**
 *
 * @author ezpadaz
 */

import java.sql.Connection;
import java.sql.SQLException;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;

public class DBPool {
   
    private static DBPool dataSource;
    private  ComboPooledDataSource cpds;
    
    private DBPool() {
      try {
         cpds = new ComboPooledDataSource();
         cpds.setDriverClass("com.mysql.cj.jdbc.Driver");
         cpds.setJdbcUrl("jdbc:mysql://localhost:3306/mydb");
         cpds.setUser("root");
         cpds.setPassword("");
         
         
      }catch (PropertyVetoException pvx) {
          System.out.println("Excepcion de Propiedades.");
          pvx.printStackTrace();
      }
   }
    
    
    public static DBPool obtenerInstancia() {
      if(dataSource==null){
          dataSource = new DBPool();
          System.out.println("Se creo una nueva pool");
      } 
        System.out.println("Se regreso una pool ya creada.");
        return dataSource;     
   }
    
    
    public Connection obtenerConexion() {
      Connection con = null;
      try {
         con = cpds.getConnection();
      } catch (SQLException e) {
          System.out.println("Error al obtener conexion!.");
         e.printStackTrace();
         return null;
      }
      return con;
   }
    
    
 }

