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
public class tbl_videos {  
    private int id_video;
    private String extencion;
    private int fk_noticia;

    public tbl_videos() {
    }

    public tbl_videos(int id_video, String extencion, int fk_noticia) {
        this.id_video = id_video;
        this.extencion = extencion;
        this.fk_noticia = fk_noticia;
    }

    public int getId_video() {
        return id_video;
    }

    public void setId_video(int id_video) {
        this.id_video = id_video;
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
