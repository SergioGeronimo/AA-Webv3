/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ezpadaz.web;

import com.ezpadaz.sec.Crypto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jorge
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/registro"})
public class RegistroServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private HttpSession session;
    private Usuario user;
    private String email;
    private String nombre;
    private String pwd;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        
        email = request.getParameter("email");
        pwd = Crypto.getSHA(request.getParameter("pwd"));
        nombre = request.getParameter("nombre");
        
        registerMethod(response,request);
        
    }

    private void registerMethod(HttpServletResponse response, HttpServletRequest request){
        if(UserControl.checkDuplicates(email)){
            printMessage(false,"El Email dado ya existe en la base de datos",response, request);
        }else {
            UserControl.register(email, pwd, nombre);
            printMessage(true,"",response, request);
        }
    }
    
    //Recibe un estado true o false, true si el registro fue satisfactorio, false si no lo fue
    public void printMessage(boolean estado,String reason, HttpServletResponse response, HttpServletRequest request){
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Registro</title>");  
            out.println("</head>");
            out.println("<body bgcolor='#2e477b'>");
            if(estado){
            out.println("<script>");
            out.println("alert('Registro satisfactorio, redirigiendo al sistema de ingreso')");
            out.println("document.location.href = './Login/login.jsp'");
            out.println("</script>");
            //response.sendRedirect(request.getContextPath()+"/Login/login.jsp");
            }else {
            out.println("<script>");
            out.println("alert('Registro invalido, "+reason+", regresando a la pagina de registro')");
            out.println("window.history.back()");
            out.println("</script>");
            }
            out.println("</body>");
            out.println("</html>");
        } catch (IOException e){
            System.out.println("Something happened boi.");
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
