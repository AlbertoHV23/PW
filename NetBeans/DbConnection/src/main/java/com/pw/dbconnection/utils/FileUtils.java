/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.utils;

/**
 *
 * @author magoc
 */
public class FileUtils {
    public static String RUTE_USER_IMAGE = "assets/IMG/Noticias";
      public static String RUTE_USER_IMAGE2 = "assets/IMG/Avatars";
    
    public static String GetExtension(String contentType) {
        switch (contentType) {
            case "image/png":
                return ".png";
            case "image/jpeg":
                return ".jpg";
            case "video/mp4":
                return ".mp4";
        }
        return ".ext";
    }
}
