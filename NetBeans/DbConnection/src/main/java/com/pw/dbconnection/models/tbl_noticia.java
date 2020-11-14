/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author geraj
 */
public class tbl_noticia {
    private int id_noticia;
    private String titulo;
    private String descripcion_corta;
    private String descripcion_larga;
    private String fecha;
    private String hora;
    private boolean aprovado;
    private int valoracion_like;
    private int valoracion_Nolike;
    private int fk_usuarios;
    private int fk_categoria;
    private String usuario;
    private String categoria;
    public List<tbl_imagenes> imagenes;
    public String video;


    
    public tbl_noticia() {
    }

    public tbl_noticia(int id_noticia, String titulo, String descripcion_corta, String descripcion_larga, String fecha, String hora, boolean aprovado, int valoracion_like, int valoracion_Nolike, String categoria, List<tbl_imagenes> imagenes, String Video) {
        this.id_noticia = id_noticia;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
        this.fecha = fecha;
        this.hora = hora;
        this.aprovado = aprovado;
        this.valoracion_like = valoracion_like;
        this.valoracion_Nolike = valoracion_Nolike;
        this.categoria = categoria;
        this.imagenes = imagenes;
        this.video = Video;
    }

    
    public tbl_noticia(int id_noticia, String titulo, String descripcion_corta, String descripcion_larga, String fecha, String hora, boolean aprovado, int valoracion_like, int valoracion_Nolike, int fk_usuarios, int fk_categoria, String categoria) {
        this.id_noticia = id_noticia;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
        this.fecha = fecha;
        this.hora = hora;
        this.aprovado = aprovado;
        this.valoracion_like = valoracion_like;
        this.valoracion_Nolike = valoracion_Nolike;
        this.fk_usuarios = fk_usuarios;
        this.fk_categoria = fk_categoria;
        this.categoria = categoria;
    }
    
    

    public tbl_noticia(int id_noticia, String titulo, String descripcion_corta, String descripcion_larga, String fecha, String hora, boolean aprovado, int valoracion_like, int valoracion_Nolike, String usuario, String categoria, List<tbl_imagenes> imagenes, String video) {
        this.id_noticia = id_noticia;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
        this.fecha = fecha;
        this.hora = hora;
        this.aprovado = aprovado;
        this.valoracion_like = valoracion_like;
        this.valoracion_Nolike = valoracion_Nolike;
        this.usuario = usuario;
        this.categoria = categoria;
        this.imagenes = imagenes;
        this.video = video;
    }
    
    

    public tbl_noticia(int id_noticia, String titulo, String descripcion_corta, String descripcion_larga, String fecha, String hora, boolean aprovado, int valoracion_like, int valoracion_Nolike, String usuario, String categoria, List<tbl_imagenes> imagenes) {
        this.id_noticia = id_noticia;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
        this.fecha = fecha;
        this.hora = hora;
        this.aprovado = aprovado;
        this.valoracion_like = valoracion_like;
        this.valoracion_Nolike = valoracion_Nolike;
        this.usuario = usuario;
        this.categoria = categoria;
        this.imagenes = imagenes;
    }

    
    public tbl_noticia(String titulo, String descripcion_corta, String descripcion_larga) {
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
    }

    public tbl_noticia(int id_noticia, String titulo, String descripcion_corta, String descripcion_larga) {
        this.id_noticia = id_noticia;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
    }
    
    

    public tbl_noticia(int id_noticia, String titulo, String descripcion_corta, String descripcion_larga, String fecha, String hora, boolean aprovado, int valoracion_like, int valoracion_Nolike, String usuario, String categoria) {
        this.id_noticia = id_noticia;
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
        this.fecha = fecha;
        this.hora = hora;
        this.aprovado = aprovado;
        this.valoracion_like = valoracion_like;
        this.valoracion_Nolike = valoracion_Nolike;
        this.usuario = usuario;
        this.categoria = categoria;
    }

    
    public tbl_noticia(String titulo, String descripcion_corta, String descripcion_larga, String fecha, String hora,int id_categoria) {
        this.titulo = titulo;
        this.descripcion_corta = descripcion_corta;
        this.descripcion_larga = descripcion_larga;
        this.fecha = fecha;
        this.hora = hora;
        this.fk_categoria = id_categoria;
    }
    
    public tbl_noticia(int id_noticia, String titulo, String descripcion_larga, String fecha, String hora, boolean aprovado, int valoracion_like, int valoracion_Nolike, int fk_usuarios, int fk_categoria) {
        this.id_noticia = id_noticia;
        this.titulo = titulo;
        this.descripcion_larga = descripcion_larga;
        this.fecha = fecha;
        this.hora = hora;
        this.aprovado = aprovado;
        this.valoracion_like = valoracion_like;
        this.valoracion_Nolike = valoracion_Nolike;
        this.fk_usuarios = fk_usuarios;
        this.fk_categoria = fk_categoria;
    }
    
    public int getId_noticia() {
        return id_noticia;
    }

    public void setId_noticia(int id_noticia) {
        this.id_noticia = id_noticia;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion_corta() {
        return descripcion_corta;
    }

    public void setDescripcion_corta(String descripcion_corta) {
        this.descripcion_corta = descripcion_corta;
    }

    public String getDescripcion_larga() {
        return descripcion_larga;
    }

    public void setDescripcion_larga(String descripcion_larga) {
        this.descripcion_larga = descripcion_larga;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
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

    public int getFk_usuarios() {
        return fk_usuarios;
    }

    public void setFk_usuarios(int fk_usuarios) {
        this.fk_usuarios = fk_usuarios;
    }

    public int getFk_categoria() {
        return fk_categoria;
    }

    public void setFk_categoria(int fk_categoria) {
        this.fk_categoria = fk_categoria;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }


    
    
}