/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import bdd.object.BddObject;
import java.sql.Connection;
import java.util.ArrayList;

/**
 *
 * @author i.m.a
 */
public class Configuration extends BddObject{
    private int utilisateurId;
    private int configurationId;
    private String config;
    private double valeur;

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
    
    public ArrayList<Configuration> getUserPref(Connection c, int utilisateurId) throws Exception{
        ArrayList<Configuration> configurations = new ArrayList<>();
        String sql = "SELECT * FROM v_userPref  WHERE utilisateurid= ?";
        ArrayList<Object> al = new ArrayList<>();
        al.add(utilisateurId);
        ArrayList<Object> liste = this.executeResultedQuery(c, sql, al);
        
        for (Object object : liste) {
            configurations.add((Configuration) object);
        }
        
        return configurations;
    }
}
