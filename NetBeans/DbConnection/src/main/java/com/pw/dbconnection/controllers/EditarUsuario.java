/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.tbl_categoria;
import com.pw.dbconnection.models.tbl_usuarios;
import com.pw.dbconnection.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author alber
 */
@WebServlet(name = "EditarUsuario", urlPatterns = {"/EditarUsuario"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class EditarUsuario extends HttpServlet {

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
            HttpSession session = request.getSession();
            tbl_usuarios usuario = (tbl_usuarios)session.getAttribute("persona"); //trae datos del controller login con la sesion activa
            request.setAttribute("datos", usuario);
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
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
             List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
            request.setAttribute("categoria", categoria);
            HttpSession session = request.getSession();
            tbl_usuarios usuario = (tbl_usuarios)session.getAttribute("persona"); //trae datos del controller login con la sesion activa
            request.setAttribute("datos", usuario);
         
            
            String pass = request.getParameter("pass");
            
            if(pass!=null){
                UserDAO.updatePass(usuario.getId_usuario(), pass);
            }
            
            
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
            

            
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
        String username = request.getParameter("username");
        
        String email = request.getParameter("email");
        String face = request.getParameter("facebook");
        String twit = request.getParameter("twiter");

        String insta = request.getParameter("instagram");
        String descripcion = request.getParameter("descripcion");
        
            String path = request.getServletContext().getRealPath(""); //ubicacion del proyecto
                // Obtenemos la Direccion donde deseamos guardarlo
                File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE2);
                // Sino existe el directorio la creamos
                        if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdir();
                        }
                // Obtenemos la imagen, debe coincidir con el name del input
                Part file = request.getPart("image");
                String contentType = file.getContentType();
                String img = file.getSubmittedFileName();
                // Remplazamos el nombre que tiene para que no existan duplicados
                String nameImage = file.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
                String fullPath = path + FileUtils.RUTE_USER_IMAGE2 + "/" + nameImage;
                
                // Copiamos la imagen en la ruta especificada
                file.write(fullPath);
                
                HttpSession session = request.getSession();
                tbl_usuarios usuario = (tbl_usuarios)session.getAttribute("persona"); //trae datos del controller login con la sesion activa
                int id_usuario = usuario.getId_usuario();
                
                if(img.equals("")){
                        tbl_usuarios update = new tbl_usuarios(usuario.getId_usuario(),usuario.getRol(),username,email,usuario.getPassword(),usuario.getImagen(),descripcion,face,twit,insta,true);
                        UserDAO.updateUsuarios(update);
                        List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
                        request.setAttribute("categoria", categoria);
                        request.setAttribute("datos", update);
                        session.setAttribute("persona", update);
                        request.getRequestDispatcher("PrincipalController").forward(request, response);  
                }
                else{
                        tbl_usuarios update = new tbl_usuarios(usuario.getId_usuario(),usuario.getRol(),username,email,usuario.getPassword(),FileUtils.RUTE_USER_IMAGE2 + "/" + nameImage,descripcion,face,twit,insta,true);
                        UserDAO.updateUsuarios(update);
                        List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
                        request.setAttribute("categoria", categoria);
                        request.setAttribute("datos", update);
                        session.setAttribute("persona", update);
                        request.getRequestDispatcher("PrincipalController").forward(request, response);  
                }
               
             
          
   
                
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
