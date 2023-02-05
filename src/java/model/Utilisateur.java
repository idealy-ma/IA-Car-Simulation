/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import annotation.PrimaryKey;
import bdd.gestionary.BDD;
import bdd.object.BddObject;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author i.m.a
 */
public class Utilisateur extends BddObject {
    @PrimaryKey
    private int id;
    private String nom;
    private double taille;
    private String login;
    private String motdepasse;

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
    
    public boolean login() throws Exception{
        try {
            Connection c = new BDD("i.m.a","login","tesla-car-simulator","postgresql")
                    .getConnection();
            this.find(c);
            if(this.getNom() != null){
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(Utilisateur.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return false;
    }
}
