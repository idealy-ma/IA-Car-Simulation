/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import bdd.object.BddObject;
import com.google.gson.reflect.TypeToken;
import java.io.File;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.Time;
import java.util.ArrayList;
import util.FileAccess;

/**
 *
 * @author i.m.a
 */
public class Configuration extends FileAccess{
    private int utilisateurId;
    private int configurationId;
    private String config;
    private double valeur;
    private String configDebut;
    private String configFin;

    public int getUtilisateurId() {
        return utilisateurId;
    }

    public void setUtilisateurId(int utilisateurId) {
        this.utilisateurId = utilisateurId;
    }

    public int getConfigurationId() {
        return configurationId;
    }

    public void setConfigurationId(int configurationId) {
        this.configurationId = configurationId;
    }

    public String getConfig() {
        return config;
    }

    public void setConfig(String config) {
        this.config = config;
    }

    public double getValeur() {
        return valeur;
    }

    public void setValeur(double valeur) {
        this.valeur = valeur;
    }

    public String getConfigDebut() {
        return configDebut;
    }

    public void setConfigDebut(String configDebut) {
        this.configDebut = configDebut;
    }

    public String getConfigFin() {
        return configFin;
    }

    public void setConfigFin(String configFin) {
        this.configFin = configFin;
    }
    
    public ArrayList<Configuration> getUserPref(int utilisateurId) throws Exception{
        Type t = new TypeToken<ArrayList<Configuration>>(){}.getType();
        ArrayList<Configuration> configurations = new ArrayList<>();
        ArrayList<Object> liste = this.findAll(new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/configuration.json"),t);
        
        for (Object object : liste) {
            Configuration configuration = (Configuration) object;
            if(configuration.getUtilisateurId() == this.getUtilisateurId()){
                configurations.add((Configuration) object);
            }
        }
        
        return configurations;
    }
}
