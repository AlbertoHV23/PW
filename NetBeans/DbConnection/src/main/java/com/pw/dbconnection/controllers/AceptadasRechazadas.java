/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.dao.noticiaDAO;
import com.pw.dbconnection.models.tbl_categoria;
import com.pw.dbconnection.models.tbl_noticia;
import com.pw.dbconnection.models.tbl_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alber
 */
@WebServlet(name = "AceptadasRechazadas", urlPatterns = {"/AceptadasRechazadas"})
public class AceptadasRechazadas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   //crea una session para cuando hace login
            HttpSession session = request.getSession();
            tbl_usuarios usuario = (tbl_usuarios)session.getAttribute("persona"); //trae datos del controller login con la sesion activa
            tbl_usuarios nologin = new tbl_usuarios(); //por si no inicio sesion   
            
            if(usuario == null){ //si no hay una session activa
                nologin = UserDAO.anonimo();
               
                // nologin.setUsername("Anonimo");
                //nologin.setRol("Anonimo");
                session.setAttribute("persona", nologin);
                request.setAttribute("datos", nologin);
            }
            else{ //si hay session activa
                   request.setAttribute("datos", usuario);
            }
         
            
            List<tbl_noticia> esperando = noticiaDAO.Aceptadas_Rechazadas(usuario.getId_usuario(), false);
            request.setAttribute("esperando", esperando);
            
            List<tbl_noticia> aceptadas = noticiaDAO.Aceptadas_Rechazadas(usuario.getId_usuario(), true);
            request.setAttribute("aceptadas", aceptadas);
            
            List<tbl_noticia> rechazadas = noticiaDAO.Rechazadas(usuario.getId_usuario());
            request.setAttribute("rechazadas", rechazadas);
            

            //Esto te traes de la base de datos todas la categorias y se las manda al jsp 
            List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
            request.setAttribute("categoria", categoria);
         
            //manda todos los datos al jsp para poder imprimir ahi
            request.getRequestDispatcher("publicadas.jsp").forward(request, response);
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
