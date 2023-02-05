/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import annotation.DBTable;
import annotation.PrimaryKey;
import bdd.gestionary.BDD;
import bdd.object.BddObject;
import java.sql.Connection;

/**
 *
 * @author i.m.a
 */
@DBTable(tableName = "kilometragefait")
public class Kilometrage extends BddObject{
    @PrimaryKey
    private int id;
    private double valeur;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getValuer() {
        return valeur;
    }

    public void setValeur(double valeur) {
        this.valeur = valeur;
    }

    @Override
    public void create(Connection c) throws Exception {
        boolean isOpen = false;
        if(c==null){
            c = new BDD("i.m.a","login","tesla-car-simulator","postgresql").
                    getConnection();
            isOpen = true;
        }
        super.create(c);
        if(isOpen){
            c.close();
        }
    }
}
