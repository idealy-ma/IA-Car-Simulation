/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import bdd.gestionary.BDD;
import bdd.object.BddObject;
import java.sql.Connection;

/**
 *
 * @author i.m.a
 */
public class Vehicule extends BddObject {
    private double kilometrage;
    private double consomation;
    private Utilisateur u;

    public Utilisateur getU() {
        return u;
    }

    public void setU(Utilisateur u) {
        this.u = u;
    }

    public double getKilometrage() {
        return kilometrage;
    }

    public void setKilometrage(double kilometrage) {
        this.kilometrage = kilometrage;
    }

    public double getConsomation() {
        return consomation;
    }

    public void setConsomation(double consomation) {
        this.consomation = consomation;
    }

    @Override
    public void find(Connection c) throws Exception {
        boolean isOpen = false;
        if(c == null){
            c = new BDD("i.m.a","login","tesla-car-simulator","postgresql").
                    getConnection();
            isOpen = true;
        }
        
        super.find(c);
        
        if(isOpen){
            c.close();
        }
    }
    
    
    
}
