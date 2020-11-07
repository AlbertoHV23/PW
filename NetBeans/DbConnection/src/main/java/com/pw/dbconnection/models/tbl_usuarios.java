/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.models;

/**
 *
 * @author alber
 */

public class tbl_usuarios {
    private String id;		
    private String userName;			
    private String Email; 		
    private String _Password;		
    private String Image; 		
    private String Rol; 			
    private String Descripcion; 		
    private String Facebook; 			
    private String Twitter;			
    private String Instagram;	 	
    private boolean Activo; 
  
    public tbl_usuarios() {
    }

    public tbl_usuarios(String Username,String Email,String _Password) {
        this.userName = userName;
        this.Email = Email;
        this._Password = _Password;

    }

    public tbl_usuarios(String id,String Username,String Email,String _Password,String Image, String Rol,
    String Descripcion,String Facebook,String Instagram,boolean Activo) {
    }

    public String getuserName() {
        return userName;
    }

    public void setuserName(String userName) {
        this.userName = userName;
    }	

    public String get_Password() {
        return _Password;
    }

    public void set_Password(String _Password) {
        this._Password = _Password;
    }

    public String getRol() {
        return Rol;
    }

    public void setRol(String Rol) {
        this.Rol = Rol;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

}
