package com.ezpadaz.sec;

import com.ezpadaz.web.UserControl;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author dev
 */
public class Crypto {
    public static String getSHA(String clave){ 
        try { 
            MessageDigest md = MessageDigest.getInstance("SHA-256"); 
            byte[] messageDigest = md.digest(clave.getBytes());  
            BigInteger no = new BigInteger(1, messageDigest); 
            String hash = no.toString(16);
            //en caso de :v
            while (hash.length() < 32) { 
                hash = "0" + hash; 
            }             
            return hash; 
        }catch (NoSuchAlgorithmException e) { 
            e.printStackTrace();
            //algo tiene que retornar
            return null;
        } 
    } 
}
