/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import annotation.PrimaryKey;
import bdd.gestionary.BDD;
import com.google.gson.reflect.TypeToken;
import java.io.File;
import java.io.FileNotFoundException;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.FileAccess;

/**
 *
 * @author i.m.a
 */
public class Utilisateur extends FileAccess {
    @PrimaryKey
    private int id;
    private String nom;
    private double taille;
    private String login;
    private String motdepasse;
    private ArrayList<Configuration> listeConfiguration;
    private Chaise preferenceChaise;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getTaille() {
        return taille;
    }

    public void setTaille(double taille) {
        this.taille = taille;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMotdepasse() {
        return motdepasse;
    }

    public void setMotdepasse(String motdepasse) {
        this.motdepasse = motdepasse;
    }

    public ArrayList<Configuration> getListeConfiguration(Connection c) throws Exception {
        if(this.listeConfiguration == null){
            boolean isOpen = false;
            this.listeConfiguration = new Configuration().getUserPref(this.getId());
        }
        return listeConfiguration;
    }

    public void setListeConfiguration(ArrayList<Configuration> listeConfiguration) {
        this.listeConfiguration = listeConfiguration;
    }

    public Chaise getPreferenceChaise(File f) throws Exception {
        if(this.preferenceChaise == null){
            f = new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/chaise.json");
            Chaise chaise = new Chaise();
            chaise.setUtilisateurId(this.getId());
            chaise = chaise.findChaise(f);
            this.setPreferenceChaise(chaise);
        }
        return preferenceChaise;
    }

    public void setPreferenceChaise(Chaise preferenceChaise) {
        this.preferenceChaise = preferenceChaise;
    }
    
    public boolean login() throws Exception{
        try {
            File f = new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/utilisateur.json");
            Type t = new TypeToken<ArrayList<Utilisateur>>(){}.getType();
            ArrayList<Object> listeObject = this.findAll(f,t);
            for (Object object : listeObject) {
                Utilisateur u = (Utilisateur) object;
                System.out.println(u.getLogin() + " mdp : " + u.getMotdepasse());
                if(this.getLogin().equals(u.getLogin()) && this.getMotdepasse().equals(u.getMotdepasse())){
                    return true;
                }
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Utilisateur.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return false;
    }
}
