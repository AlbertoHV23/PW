/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.models.tbl_usuarios;
import com.pw.dbconnection.models.tbl_categoria;
import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author magoc
 */
public class UserDAO {

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
    public static int insertUser(UserModel user) {
        try {
            Connection con = DbConnection.getConnection();
            // En el proyecto solo podran hacer uso de Store Procedures
            // No llamadas directas como esta
            // Esta linea prepara la llamada a la base de datos para insertar
            // Cada ? significa un valor a ser remplazado
            CallableStatement statement = con.prepareCall("INSERT INTO user (nameUser, password, urlImage) VALUES (?,?,?)");
            // Remplazamos el primer parametro por el nombre
            statement.setString(1, user.getUserName());
            // El segundo por la contraseña
            statement.setString(2, user.getPassword());
            // El ultimo por la url de la imagen
            statement.setString(3, user.getUrlImage());
            // Ejecuta el Statement y retorna cuantos registros
            // fueron actualizados
            statement.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }

    public static int insertUsuarios(tbl_usuarios users) {
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_insert_users(?,?,?,?,?,?,?,?,?,?);");
            statement.setString(1, users.getRol());
            statement.setString(2, users.getUsername());
            statement.setString(3, users.getEmail());
            statement.setString(4, users.getPassword());
            statement.setString(5, "assets/IMG/Avatars/default.png");
            statement.setString(6, "null");
            statement.setString(7, "null");
            statement.setString(8, "null");
            statement.setString(9, "null");
            statement.setBoolean(10, true);
          
            statement.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }

    public static tbl_usuarios login(String usua,String contra, String rol){
        tbl_usuarios retorno =new tbl_usuarios();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call Sp_login(?,?,?);");
            statement.setString(1, usua);
            statement.setString(2, contra);
            statement.setString(3, rol);

            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                int id = resultSet.getInt("id_usuario");
                String tipo = resultSet.getString("rol");
                String correo = resultSet.getString("email");
                String name = resultSet.getString("username");
                String Pass = resultSet.getString("_password");
                String imagen = resultSet.getString("imagen");
                String descripcion = resultSet.getString("descripcion");
                String face = resultSet.getString("face");
                String twit = resultSet.getString("twit");
                String insta = resultSet.getString("insta");
                boolean activo = resultSet.getBoolean("activo");
              


                retorno = new tbl_usuarios(id, tipo,name,correo,Pass,imagen,descripcion,face,twit,insta,activo);
                
            }
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }
    
    public static tbl_usuarios anonimo(){
        tbl_usuarios retorno =new tbl_usuarios();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("call anonimo();");
         

            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                int id = resultSet.getInt("id_usuario");
                String tipo = resultSet.getString("rol");
                String name = resultSet.getString("username");
                String imagen = resultSet.getString("imagen");
                boolean activo = resultSet.getBoolean("activo");
              


                retorno = new tbl_usuarios(id, tipo,name,imagen,activo);
                
            }
            
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
           
        }
        return retorno;
    }

    public static List<UserModel> getUsers() {
        List<UserModel> users = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("SELECT * FROM user");
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                String name = resultSet.getString("nameUser");
                String password = resultSet.getString("password");
                String urlImage = resultSet.getString("urlImage");
                // Agregamos el usuario a la lista
                users.add(new UserModel(name, password, urlImage));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            return users;
        }
    }

    public static List<tbl_categoria> llenarcategoria() {
        List<tbl_categoria> categoria = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("SELECT * FROM tbl_categoria");
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                String name = resultSet.getString("nombre");
         
                // Agregamos el usuario a la lista
                categoria.add(new tbl_categoria(name));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            return categoria;
        }
    }
    
    
     public static int updateUsuarios(tbl_usuarios users) {
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_update_datos_usuario(?,?,?,?,?,?,?,?);");
            statement.setInt(1,users.getId_usuario());
            statement.setString(2, users.getUsername());
            statement.setString(3, users.getEmail());
            statement.setString(4, users.getImagen());
            statement.setString(5, users.getDescripcion());
            statement.setString(6, users.getFace());
            statement.setString(7, users.getTwit());
            statement.setString(8, users.getInsta());
          
            statement.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }
     
     
      public static int updatePass(int id, String pass) {
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL Sp_update_pass(?,?);");
            statement.setInt(1,id);
            statement.setString(2, pass);
           
          
            statement.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
        }
        return 0;
    }
        
        
}
