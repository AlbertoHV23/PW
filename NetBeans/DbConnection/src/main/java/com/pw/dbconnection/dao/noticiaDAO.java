/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.models.tbl_categoria;
import com.pw.dbconnection.models.tbl_comentario_a_comentario;
import com.pw.dbconnection.models.tbl_comentarios;
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
            statement.setInt(10, data.getFk_usuarios());
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

    //noticias que ya estan publicadas, las que se va a mostar en la pagina cuando abres una noticia
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
    
    public static List<tbl_noticia> GetNoticiasActivas() {
        List<tbl_noticia> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticia_Activas();");
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

   public static List<tbl_noticia> nuevas() {
        List<tbl_noticia> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticia_news();");
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

     public static int Aprovar(int  id){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticia_Aprovar(?);");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
     
     public static int Marcar(int  fk_usuario, int fk_noticia){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_marcadas_insert(?,?,?);");
            statement.setInt(1, 0);
            statement.setInt(2, fk_usuario);
            statement.setInt(3, fk_noticia);
            ResultSet resultSet = statement.executeQuery();
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
     
     public static int Comentar(int  fk_usuario, int fk_noticia, String comentario){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_comentarios_insert(?,?,?,?,?,?,?);");
            statement.setInt(1, 0);
            statement.setString(2, comentario);
            statement.setInt(3, fk_usuario);
            statement.setInt(4, fk_noticia);
            statement.setInt(5, 0);
            statement.setInt(6, 0);
            statement.setBoolean(7,true);
            ResultSet resultSet = statement.executeQuery();
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
     
      public static int Update_noticia(int  noticia,String titulo,String des,String desla,int categoria){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticias_update(?,?,?,?,?);");
            statement.setInt(1, noticia);
            statement.setString(2, titulo);
            statement.setString(3, des);
            statement.setString(4, desla);

            statement.setInt(5, categoria);
            
            ResultSet resultSet = statement.executeQuery();
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
     
     
     public static int ComentarComentario(int  fk_usuario, int fk_coment, String comentario, int usuario){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_comentarioacomentario_insert(?,?,?,?,?);");
            statement.setInt(1, 0);
            statement.setInt(2, fk_coment);
            statement.setString(3, comentario);
            statement.setBoolean(4,false);
            statement.setInt(5, usuario);
            ResultSet resultSet = statement.executeQuery();
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
     
    public static List<tbl_noticia> noticias_marcadas(int id_usuario) {
        List<tbl_noticia> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_noticias_marcadas(?);");
            statement.setInt(1, id_usuario);
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
               
                String video = GetVideo(id);
                List<tbl_imagenes> imagenes = GetImagen(id);  
                
                // Agregamos el usuario a la lista
               noticia.add(new tbl_noticia(id,titulo,des,descripcion,fecha,hora,aprovado,like,dislike,imagenes,video));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            return noticia;
        }
    }
     
    public static List<tbl_comentarios> GetComentarios(int palabra) {
        List<tbl_comentarios> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL traer_comentarios(?);");
            statement.setInt(1, palabra);
            ResultSet resultSet = statement.executeQuery();
          
            while (resultSet.next()) {
               
                int id = resultSet.getInt("id_comentario");
                String comen = resultSet.getString("comentario");
                String user = resultSet.getString("username");
                String image= resultSet.getString("imagen");
                
                
               List<tbl_comentario_a_comentario> respuestas = GetComentarios_respuestas(id);
           
                
                // Agregamos el usuario a la lista
                noticia.add(new tbl_comentarios(id,comen,user,image,respuestas));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            
        }
            return noticia;
        
    }
    
    public static List<tbl_comentario_a_comentario> GetComentarios_respuestas(int palabra) {
        List<tbl_comentario_a_comentario> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Traer_comentario_comentario(?);");
            statement.setInt(1, palabra);
            ResultSet resultSet = statement.executeQuery();
          
            while (resultSet.next()) {
               
                int id = resultSet.getInt("id_sub_comentario");
                String comen = resultSet.getString("comentario");
                String user = resultSet.getString("username");
                String image= resultSet.getString("imagen");
                
                
               
           
                
                // Agregamos el usuario a la lista
                noticia.add(new tbl_comentario_a_comentario(id,comen,user,image));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            
        }
            return noticia;
        
    }
   
    public static List<tbl_noticia> Aceptadas_Rechazadas(int id_, boolean bool) {
        List<tbl_noticia> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_Aprovadas_rexhazadas(?,?);");
            statement.setInt(1, id_);
            statement.setBoolean(2, bool);
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
    
    public static int Rechaza_insert_comentario(int  noticia, String _coment){
        int retorno = 0;
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL insert_comentario_noticia_rechazada(?,?);");
            statement.setInt(1, noticia);
            statement.setString(2, _coment);
           
            ResultSet resultSet = statement.executeQuery();
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
    
    public static List<tbl_noticia> Rechazadas(int id_) {
        List<tbl_noticia> noticia = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_rechazadas_comentario(?);");
            statement.setInt(1, id_);
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
                String come = resultSet.getString("comentario");
               
                String video = GetVideo(id);
                List<tbl_imagenes> imagenes = GetImagen(id);  
                
                // Agregamos el usuario a la lista
                noticia.add(new tbl_noticia(id,titulo,des,descripcion,fecha,hora,aprovado,like,dislike,usuario,categoria,imagenes,video,come));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            return noticia;
        }
    }
    
}


