/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.models;

/**
 *
 * @author geraj
 */
public class tbl_comentario_a_comentario {
    private int id_sub_comentario;
    private int fk_comentario;
    private String comentario; 
    private String username;
    private String imagen;
    
    private boolean aprovado;

    public tbl_comentario_a_comentario() {
    }

    public tbl_comentario_a_comentario(int id_sub_comentario, int fk_comentario, String comentario, boolean aprovado) {
        this.id_sub_comentario = id_sub_comentario;
        this.fk_comentario = fk_comentario;
        this.comentario = comentario;
        this.aprovado = aprovado;
    }

    public tbl_comentario_a_comentario(int id_sub_comentario, String comentario, String username, String imagen) {
        this.id_sub_comentario = id_sub_comentario;
        this.comentario = comentario;
        this.username = username;
        this.imagen = imagen;
    }

    
    
    public int getId_sub_comentario() {
        return id_sub_comentario;
    }

    public void setId_sub_comentario(int id_sub_comentario) {
        this.id_sub_comentario = id_sub_comentario;
    }

    public int getFk_comentario() {
        return fk_comentario;
    }

    public void setFk_comentario(int fk_comentario) {
        this.fk_comentario = fk_comentario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
    }  

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
}
