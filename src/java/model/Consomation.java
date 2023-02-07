/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import util.FileAccess;

/**
 *
 * @author i.m.a
 */
public class Consomation extends FileAccess {
    private double puissance;
    private double vitesse;

    public double getPuissance() {
        return puissance;
    }

    public void setPuissance(double puissance) {
        this.puissance = puissance;
    }

    public double getVitesse() {
        return vitesse;
    }

    public void setVitesse(double vitesse) {
        this.vitesse = vitesse;
    }
    
    public double getConsomation(double vitesse){
        return (vitesse*this.getPuissance())/this.getVitesse();
    }

    @Override
    public String toString() {
        return this.getPuissance()+"W/"+this.getVitesse();
    }
}
