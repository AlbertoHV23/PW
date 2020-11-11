/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.models.tbl_categoria;
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
            statement.setInt(10, 3);
            statement.setInt(11, 3);
        
          
            return statement.executeUpdate();
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
            
        
          
            return statement.executeUpdate();
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
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }

  

    
}


