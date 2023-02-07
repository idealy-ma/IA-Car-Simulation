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
public class Vehicule extends FileAccess {
    private double autonomie;
    private Consomation consommation;
    private double battery;
    private double vitesse;
    private Utilisateur u;

    public Utilisateur getU() {
        return u;
    }

    public void setU(Utilisateur u) {
        this.u = u;
    }

    public double getAutonomie() throws FileNotFoundException {
        autonomie = battery - consommation.getConsomation(this.getVitesse());
        return autonomie;
    }

    public double getVitesse() throws FileNotFoundException {
        Type t = new TypeToken<ArrayList<Vitesse>>(){}.getType();
        File f = new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/vitesse.json");
        ArrayList<Object> listeObjet = new Vitesse().findAll(f, t);
        Vitesse v = (Vitesse)listeObjet.get(listeObjet.size()-1);
        return v.getVitesse();
    }

    public void setVitesse(double vitesse) {
        this.vitesse = vitesse;
    }

    public void setAutonomie(double autonomie) {
        this.autonomie = autonomie;
    }

    public double getBattery() {
        return battery;
    }

    public void setBattery(double battery) {
        this.battery = battery;
    }

    public Consomation getConsomation() throws FileNotFoundException {
        File f = new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/configuration.json");
        if(consommation == null){
            Type t = new TypeToken<ArrayList<Consomation>>(){}.getType();
            consommation = new Consomation();
            consommation = (Consomation)consommation.findAll(f, t).get(0);
            System.out.println(consommation.getPuissance());
        }
        return consommation;
    }

    public void setConsomation(Consomation consommation) {
        this.consommation = consommation;
    }

    @Override
    public Object find(File f) throws FileNotFoundException {
        Type t = new TypeToken<ArrayList<Vehicule>>(){}.getType();
        f = new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/vehicule.json");
        ArrayList<Object> objectList = super.findAll(f,t);
        return objectList.get(0); 
    }
}
