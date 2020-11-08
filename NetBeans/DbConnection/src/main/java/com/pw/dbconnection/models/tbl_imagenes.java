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
public class tbl_imagenes {
    private int id_imagen;
    private String extencion;
    private int fk_noticia;

    public tbl_imagenes() {
    }

    public tbl_imagenes(int id_imagen, String extencion, int fk_noticia) {
        this.id_imagen = id_imagen;
        this.extencion = extencion;
        this.fk_noticia = fk_noticia;
    }

    public int getId_imagen() {
        return id_imagen;
    }

    public void setId_imagen(int id_imagen) {
        this.id_imagen = id_imagen;
    }

    public String getExtencion() {
        return extencion;
    }

    public void setExtencion(String extencion) {
        this.extencion = extencion;
    }

    public int getFk_noticia() {
        return fk_noticia;
    }

    public void setFk_noticia(int fk_noticia) {
        this.fk_noticia = fk_noticia;
    }
}
