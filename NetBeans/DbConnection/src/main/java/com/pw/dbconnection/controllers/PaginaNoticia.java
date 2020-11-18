/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.dao.noticiaDAO;
import com.pw.dbconnection.models.tbl_categoria;
import com.pw.dbconnection.models.tbl_comentarios;
import com.pw.dbconnection.models.tbl_noticia;
import com.pw.dbconnection.models.tbl_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alber
 */
@WebServlet(name = "PaginaNoticia", urlPatterns = {"/PaginaNoticia"})
public class PaginaNoticia extends HttpServlet {

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
             List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
             request.setAttribute("categoria", categoria);

             request.getRequestDispatcher("noticia.jsp").forward(request, response);
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
            String id_noti = request.getParameter("ID");
             
               //crea una session para cuando hace login
            HttpSession session = request.getSession();
            tbl_usuarios usuario = (tbl_usuarios)session.getAttribute("persona"); //trae datos del controller login con la sesion activa
            tbl_usuarios nologin = new tbl_usuarios(); //por si no inicio sesion   
            
            if(usuario == null){ //si no hay una session activa
                nologin.setUsername("Anonimo");
                nologin.setRol("Anonimo");
                request.setAttribute("datos", nologin);
            }
            else{ //si hay session activa
                   request.setAttribute("datos", usuario);
            }
            
          
            
            
            List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
            request.setAttribute("categoria", categoria);
            
            String comen = request.getParameter("comentario");
        
             
             if(id_noti != null){
                   int id_noticia = Integer.parseInt(id_noti);
                   tbl_noticia noticia = noticiaDAO.Noticia(id_noticia);
                   request.setAttribute("noticia", noticia);
                   List<tbl_comentarios> comentarios = noticiaDAO.GetComentarios(id_noticia);
                   request.setAttribute("comentarios", comentarios);
             }
             
             
             String marcar = request.getParameter("Si");
             
              if(marcar != null){
                 int id_noticia_marcar = Integer.parseInt(marcar);
                 tbl_noticia noticia = noticiaDAO.Noticia(id_noticia_marcar);
                 request.setAttribute("noticia", noticia);
                 noticiaDAO.Marcar(usuario.getId_usuario(), id_noticia_marcar);
                 List<tbl_comentarios> comentarios = noticiaDAO.GetComentarios(id_noticia_marcar);
                 request.setAttribute("comentarios", comentarios);
                 
             }
       
          
           
            
             request.getRequestDispatcher("noticia.jsp").forward(request, response);
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
          
            

             
               //crea una session para cuando hace login
            HttpSession session = request.getSession();
            tbl_usuarios usuario = (tbl_usuarios)session.getAttribute("persona"); //trae datos del controller login con la sesion activa
            tbl_usuarios nologin = new tbl_usuarios(); //por si no inicio sesion   
            
            if(usuario == null){ //si no hay una session activa
                nologin.setUsername("Anonimo");
                nologin.setRol("Anonimo");
                request.setAttribute("datos", nologin);
            }
            else{ //si hay session activa
                   request.setAttribute("datos", usuario);
            }
            String comen = request.getParameter("comentario");
            String ids = request.getParameter("password");


            
            List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
            request.setAttribute("categoria", categoria);
             
           if(ids != null){
                int id_notis = Integer.parseInt(ids);
                tbl_noticia noticia = noticiaDAO.Noticia(id_notis);
                noticiaDAO.Comentar(usuario.getId_usuario(), id_notis, comen);
                request.setAttribute("noticia", noticia);
                List<tbl_comentarios> comentarios = noticiaDAO.GetComentarios(id_notis);
                request.setAttribute("comentarios", comentarios);
           }
           
            request.getRequestDispatcher("noticia.jsp").forward(request, response);
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
