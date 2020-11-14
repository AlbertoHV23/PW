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
import com.pw.dbconnection.utils.FileUtils;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author alber
 */
@WebServlet(name="PublicarNoticia", urlPatterns={"/PublicarNoticia"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)

public class PublicarNoticia extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
             List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
             request.setAttribute("categoria", categoria);
             
           
             request.getRequestDispatcher("crear.jsp").forward(request, response);
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String video = request.getParameter("video");
        String titulo = request.getParameter("titulo");
        String des = request.getParameter("des_corta");
        String descripcion = request.getParameter("descripcion");
        String cate = request.getParameter("categoria");
        Date date = new Date();
        DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
        String hora = hourFormat.format(date);
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String fecha =dateFormat.format(date);
        int id_categoria = noticiaDAO.IdCategoria(cate);
        tbl_noticia noticia = new tbl_noticia(titulo,des,descripcion,fecha,hora,id_categoria);
        
       
        int id =0;         
       noticiaDAO.insertNoticia(noticia);
        id = noticiaDAO.selectid(titulo);
            if(id != 0){
                
                String path = request.getServletContext().getRealPath(""); //ubicacion del proyecto
                // Obtenemos la Direccion donde deseamos guardarlo
                File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE);
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
                String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
                
                // Copiamos la imagen en la ruta especificada
                file.write(fullPath);
                                
               
                Part file2 = request.getPart("image2");
                String img2 = file2.getSubmittedFileName();
                String contentType2 = file2.getContentType();
                String nameImage2 = file2.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
                String fullPath2 = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage2;
                file2.write(fullPath2);
                                
                Part file3 = request.getPart("image3");
                String img3 = file3.getSubmittedFileName();
                String contentType3 = file3.getContentType();
                String nameImage3 = file3.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
                String fullPath3 = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage3;
                file3.write(fullPath3);
                
                                if(img !=""){
                                   noticiaDAO.NoticiaImagen(FileUtils.RUTE_USER_IMAGE + "/" + nameImage,id);  
                                }
                                if(img2 !=""){
                                   noticiaDAO.NoticiaImagen(FileUtils.RUTE_USER_IMAGE + "/" + nameImage2,id);  
                                }
                                 if(img3 !=""){
                                   noticiaDAO.NoticiaImagen(FileUtils.RUTE_USER_IMAGE + "/" + nameImage3,id);  
                                }  
                                
                               if(video != ""){
                                  noticiaDAO.NoticiaVideo(video,id);  
  
                                }
                      }
                 
             List<tbl_categoria> categoria = UserDAO.llenarcategoria(); 
             request.setAttribute("categoria", categoria);
             request.getRequestDispatcher("crear.jsp").forward(request, response);                
       
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