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
public class tbl_comentarios {   
    private int id_comentario;
    private String comentario;
    private int fk_usuario;
    private int fk_noticia;
    private int valoracion_like;
    private int valoracion_Nolike;
    private boolean aprovado;

    public tbl_comentarios() {
    }

    public tbl_comentarios(int id_comentario, String comentario, int fk_usuario, int fk_noticia, int valoracion_like, int valoracion_Nolike, boolean aprovado) {
        this.id_comentario = id_comentario;
        this.comentario = comentario;
        this.fk_usuario = fk_usuario;
        this.fk_noticia = fk_noticia;
        this.valoracion_like = valoracion_like;
        this.valoracion_Nolike = valoracion_Nolike;
        this.aprovado = aprovado;
    }

    public int getId_comentario() {
        return id_comentario;
    }

    public void setId_comentario(int id_comentario) {
        this.id_comentario = id_comentario;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getFk_usuario() {
        return fk_usuario;
    }

    public void setFk_usuario(int fk_usuario) {
        this.fk_usuario = fk_usuario;
    }

    public int getFk_noticia() {
        return fk_noticia;
    }

    public void setFk_noticia(int fk_noticia) {
        this.fk_noticia = fk_noticia;
    }

    public int getValoracion_like() {
        return valoracion_like;
    }

    public void setValoracion_like(int valoracion_like) {
        this.valoracion_like = valoracion_like;
    }

    public int getValoracion_Nolike() {
        return valoracion_Nolike;
    }

    public void setValoracion_Nolike(int valoracion_Nolike) {
        this.valoracion_Nolike = valoracion_Nolike;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
    }
}
