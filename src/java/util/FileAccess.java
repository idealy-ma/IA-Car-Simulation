/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;

/**
 *
 * @author i.m.a
 */
public class FileAccess {
    public void create(File f, Type type) throws IOException{
        Gson gson = new Gson();
        ArrayList<Object> obj = this.findAll(f, type);
        obj.add(this);
        System.out.println();
        try (FileWriter fr = new FileWriter(f)) {
            fr.write(gson.toJson(obj));
            fr.flush();
        }
    }
    
    public ArrayList<Object> findAll(File f, Type type) throws FileNotFoundException{
        Gson gson = new Gson();
	// 1. JSON file to Java object

	ArrayList<Object> object = (ArrayList<Object>)gson.fromJson(new FileReader(f), type);
        return object;
    }
    
    public Object find(File f) throws FileNotFoundException{
        Gson gson = new Gson();
	// 1. JSON file to Java object
	Object object = gson.fromJson(new FileReader(f), this.getClass());
        return object;
    }
}
