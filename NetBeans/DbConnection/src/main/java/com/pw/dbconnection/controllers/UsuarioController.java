/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.controllers;
import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.tbl_usuarios;
import com.pw.dbconnection.utils.FileUtils;
import com.pw.dbconnection.models.tbl_categoria;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


/**
 *
 * @author alber
 */
@WebServlet(name="UsuarioController", urlPatterns={"/UsuarioController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class UsuarioController extends HttpServlet {
   
       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
       throws ServletException, IOException {
           response.sendRedirect("login.jsp");
           
       }
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                String name = request.getParameter("usuario");
                String password = request.getParameter("contra");
                String rol = request.getParameter("tipo");
           
          
                tbl_usuarios retorno = UserDAO.login(name,password,rol);
                
                if(retorno.getId_usuario() != 0){
                     System.out.println("LOGIN EXITOSO");
                     List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
                     request.setAttribute("categoria", categoria);
                     String test = "TEST";
                     
                    HttpSession session = request.getSession();
                    session.setAttribute("persona", retorno);

            
                    
                    
                    request.getRequestDispatcher("PrincipalController").forward(request, response);
               
                }
                else{
                System.out.println("ERROR");
              
                response.sendRedirect("login.jsp");

                }
        
         

}
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");
       
       
        // String rol = "Normal";
        tbl_usuarios user = new tbl_usuarios(rol,name,email,password);
        UserDAO.insertUsuarios(user);
        response.sendRedirect("login.jsp");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
