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

    public tbl_usuarios(String userName, String Email, String _Password) {
        this.userName = userName;
        this.Email = Email;
        this._Password = _Password;
    }


    public tbl_usuarios(String userName, String Email, String _Password, String Rol) {
        this.userName = userName;
        this.Email = Email;
        this._Password = _Password;
        this.Rol = Rol;
    }


    public tbl_usuarios(String id, String userName, String Email, String _Password, String Image, String Rol, String Descripcion, String Facebook, String Twitter, String Instagram, boolean Activo) {
        this.id = id;
        this.userName = userName;
        this.Email = Email;
        this._Password = _Password;
        this.Image = Image;
        this.Rol = Rol;
        this.Descripcion = Descripcion;
        this.Facebook = Facebook;
        this.Twitter = Twitter;
        this.Instagram = Instagram;
        this.Activo = Activo;
    }



    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getEmail() {
        return this.Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String get_Password() {
        return this._Password;
    }

    public void set_Password(String _Password) {
        this._Password = _Password;
    }


    public String getImage() {
        return this.Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getRol() {
        return this.Rol;
    }

    public void setRol(String Rol) {
        this.Rol = Rol;
    }


    
}
