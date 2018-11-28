package com.moran.db;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;
/**
 *
 * @author Angel Adiel Moran tuz.
 */
public class PoolDB {
    private static Connection con = null;
    private final String URL = "jdbc:mysql://localhost:3306/aire_acondicionado";
    private final String driver = "com.mysql.cj.jdbc.Driver";
    private final String user = "root";
    private final String password = "";
    
    private static PoolDB pool;
    private  static ComboPooledDataSource cpds;
    
    private PoolDB(){
        try {
            cpds = new ComboPooledDataSource();
            cpds.setDriverClass(driver);
            cpds.setJdbcUrl(URL);
            cpds.setUser(user);
            cpds.setPassword(password);
        } catch (PropertyVetoException e) {
            System.out.println("Pool creada.");
            e.printStackTrace();
        }
    }
    
    public static PoolDB getPool(){
        if(pool == null){
            pool = new PoolDB();
        }
        return pool;
    }
    
    public static Connection getCon(){
        try{
            
            con = cpds.getConnection();
            System.out.println("Conexion creada.");
        }catch(SQLException e){
            System.out.println("Error de conexion.");
            e.printStackTrace();
        }
        return  con;
    }
}