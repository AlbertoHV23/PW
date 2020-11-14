/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.models.tbl_categoria;
import com.pw.dbconnection.models.tbl_imagenes;
import com.pw.dbconnection.models.tbl_noticia;
import com.pw.dbconnection.models.tbl_usuarios;

import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author alber
 */
public class noticiaDAO {
 // Query de creacion de Tabla
    /**
     * CREATE TABLE `user` ( `idUser` INT NOT NULL AUTO_INCREMENT, `nameUser`
     * VARCHAR(45) NULL, `password` VARCHAR(45) NULL, `urlImage` VARCHAR(255)
     * NULL, PRIMARY KEY (`idUser`));
     *
     */
    /**
     * Inserta un usuario en la base de datos
     *
     * @param user
     * @return
     */
    

    public static int insertNoticia(tbl_noticia data) {
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticias_insert(?,?,?,?,?,?,?,?,?,?,?)");
            statement.setInt(1, 0);
            statement.setString(2, data.getTitulo());
            statement.setString(3, data.getDescripcion_corta());
            statement.setString(4, data.getDescripcion_larga());
            statement.setString(5, data.getFecha());
            statement.setString(6, data.getHora());
            statement.setBoolean(7, false);
            statement.setInt(8, 0);
            statement.setInt(9, 0);
            statement.setInt(10, 24);
            statement.setInt(11, data.getFk_categoria());
        
          
            statement.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }
    
    public static int NoticiaImagen(String url,int id) {
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_imagen_insert(?,?,?);");
            statement.setInt(1, 0);
            statement.setString(2, url);
            statement.setInt(3, id);
            
        
          
            statement.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }
    
    public static int NoticiaVideo(String url,int id) {
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_videos_insert(?,?,?);");
            statement.setInt(1, 0);
            statement.setString(2, url);
            statement.setInt(3, id);
            
        
          
            statement.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }

    public static int selectid(String titulo){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL `Sp_noticia_id`(?);");
            statement.setString(1, titulo);
         

            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                retorno = resultSet.getInt("id_noticia");
              
                
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }

    //noticias que ya estan publicadas, las que se va a mostar en la pagina cuando abres uan noticia
    public static tbl_noticia Noticia(int id_noticia) {
       tbl_noticia noticia = new tbl_noticia();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticias_select(?);");
            statement.setInt(1, id_noticia);
            ResultSet resultSet = statement.executeQuery();
        
            while (resultSet.next()) {
               
                int id = resultSet.getInt("id_noticia");
                String titulo = resultSet.getString("titulo");
                String des = resultSet.getString("descripcion_corta");
                String descripcion= resultSet.getString("descripcion_larga");
                String fecha= resultSet.getString("fecha");
                String hora= resultSet.getString("hora");
                boolean aprovado = resultSet.getBoolean("aprovado");
                int like = resultSet.getInt("valoracion_like");
                int dislike = resultSet.getInt("valoracion_Nolike");
                String categoria = resultSet.getString("nombre");
                String usuario = resultSet.getString("username");
               
                String video = GetVideo(id);
                List<tbl_imagenes> imagenes = GetImagen(id);  
                
                // Agregamos el usuario a la lista
               return new tbl_noticia(id,titulo,des,descripcion,fecha,hora,aprovado,like,dislike,usuario,categoria,imagenes,video);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } 
        return noticia;
    }
    
    public static List<tbl_noticia> GetNoticiasNoActivas() {
        List<tbl_noticia> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticia_NoActiva();");
            ResultSet resultSet = statement.executeQuery();
        
            while (resultSet.next()) {
               
                int id = resultSet.getInt("id_noticia");
                String titulo = resultSet.getString("titulo");
                String des = resultSet.getString("descripcion_corta");
                String descripcion= resultSet.getString("descripcion_larga");
                String fecha= resultSet.getString("fecha");
                String hora= resultSet.getString("hora");
                boolean aprovado = resultSet.getBoolean("aprovado");
                int like = resultSet.getInt("valoracion_like");
                int dislike = resultSet.getInt("valoracion_Nolike");
                String categoria = resultSet.getString("nombre");
                String usuario = resultSet.getString("username");
               
                String video = GetVideo(id);
                List<tbl_imagenes> imagenes = GetImagen(id);  
                
                // Agregamos el usuario a la lista
                noticia.add(new tbl_noticia(id,titulo,des,descripcion,fecha,hora,aprovado,like,dislike,usuario,categoria,imagenes,video));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            return noticia;
        }
    }


   public static List<tbl_imagenes> GetImagen(int id) {
       List<tbl_imagenes> retorno = new ArrayList<>();
       try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_imagen_selectxFk(?);");
            statement.setInt(1, id);
             ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                int id_img = resultSet.getInt("id_imagen");
                String url = resultSet.getString("extencion");
              
                retorno.add(new tbl_imagenes(id_img,url));
            }
            
        con.close();
          
          
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return retorno;
    }
   
   public static String GetVideo(int id){
        String retorno = "";
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL `Sp_videos_selectId`(?);");
            statement.setInt(1, id);
         

            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                retorno = resultSet.getString("extencion");
              
                
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
   
   public static int IdCategoria(String titulo){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL `Sp_categoria_selectid`(?);");
            statement.setString(1, titulo);
         

            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                retorno = resultSet.getInt("id_categoria");
              
                
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
   
   public static List<tbl_noticia> searh(String palabra) {
        List<tbl_noticia> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_buscar(?);");
            statement.setString(1, palabra);
            ResultSet resultSet = statement.executeQuery();
          
            while (resultSet.next()) {
               
                int id = resultSet.getInt("id_noticia");
                String titulo = resultSet.getString("titulo");
                String des = resultSet.getString("descripcion_corta");
                String descripcion= resultSet.getString("descripcion_larga");
                String fecha= resultSet.getString("fecha");
                String hora= resultSet.getString("hora");
                boolean aprovado = resultSet.getBoolean("aprovado");
                int like = resultSet.getInt("valoracion_like");
                int dislike = resultSet.getInt("valoracion_Nolike");
                String categoria = resultSet.getString("nombre");
                
               
                String video = GetVideo(id);
                List<tbl_imagenes> imagenes = GetImagen(id);  
                
                // Agregamos el usuario a la lista
                noticia.add(new tbl_noticia(id,titulo,des,descripcion,fecha,hora,aprovado,like,dislike,categoria,imagenes,video));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            
        }
            return noticia;
        
    }

   
}


