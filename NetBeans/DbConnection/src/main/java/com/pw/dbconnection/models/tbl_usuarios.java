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
    private int id_usuario;		
    private String rol;			
    private String username; 		
    private String email;		
    private String _password; 		
    private String imagen; 			
    private String descripcion; 		
    private String face; 			
    private String twit;			
    private String insta;	 	
    private boolean activo;

    public tbl_usuarios() {
    }
    
    public tbl_usuarios(int id_usuario, String rol, String username, String email, String _password, String imagen, String descripcion, String face, String twit, String insta, boolean activo) {
        this.id_usuario = id_usuario;
        this.rol = rol;
        this.username = username;
        this.email = email;
        this._password = _password;
        this.imagen = imagen;
        this.descripcion = descripcion;
        this.face = face;
        this.twit = twit;
        this.insta = insta;
        this.activo = activo;
    }


    public tbl_usuarios(String rol, String username, String email, String _password) {
        this.rol = rol;
        this.username = username;
        this.email = email;
        this._password = _password;
    }


    public tbl_usuarios(int id_usuario, String rol, String username, String email, String _password) {
        this.id_usuario = id_usuario;
        this.rol = rol;
        this.username = username;
        this.email = email;
        this._password = _password;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return _password;
    }

    public void setPassword(String _password) {
        this._password = _password;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public String getTwit() {
        return twit;
    }

    public void setTwit(String twit) {
        this.twit = twit;
    }

    public String getInsta() {
        return insta;
    }

    public void setInsta(String insta) {
        this.insta = insta;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    
}