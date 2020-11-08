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
public class tbl_marcadas {
    private int id_marcadas;
    private int fk_usuario;
    private int fk_noticia;

    public tbl_marcadas() {
    }

    public tbl_marcadas(int id_marcadas, int fk_usuario, int fk_noticia) {
        this.id_marcadas = id_marcadas;
        this.fk_usuario = fk_usuario;
        this.fk_noticia = fk_noticia;
    }

    public int getId_marcadas() {
        return id_marcadas;
    }

    public void setId_marcadas(int id_marcadas) {
        this.id_marcadas = id_marcadas;
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
}
