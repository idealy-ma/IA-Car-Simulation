/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import com.google.gson.reflect.TypeToken;
import java.io.File;
import java.io.FileNotFoundException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import util.FileAccess;

/**
 *
 * @author i.m.a
 */

public class Chaise extends FileAccess{
    private int utilisateurId;
    private double posX;
    private double posY;
    private double defaultX;
    private double defaultY;

    public int getUtilisateurId() {
        return utilisateurId;
    }

    public void setUtilisateurId(int utilisateurId) {
        this.utilisateurId = utilisateurId;
    }

    public double getPosX() {
        return posX;
    }

    public void setPosX(double posX) {
        this.posX = posX;
    }

    public double getPosY() {
        return posY;
    }

    public void setPosY(double posY) {
        this.posY = posY;
    }

    public double getDefaultX() {
        return defaultX;
    }

    public void setDefaultX(double defaultX) {
        this.defaultX = defaultX;
    }

    public double getDefaultY() {
        return defaultY;
    }

    public void setDefaultY(double defaultY) {
        this.defaultY = defaultY;
    }
    
    public Chaise findChaise(File f) throws FileNotFoundException{
        Type t = new TypeToken<ArrayList<Chaise>>(){}.getType();
        ArrayList<Object> obj = this.findAll(f, t);
        Chaise ch = null;
        for (Object object : obj) {
            ch = (Chaise) object;
            if(ch.getUtilisateurId() == this.getUtilisateurId()){
                return ch;
            }
        }
        
        return ch;
    }
}
