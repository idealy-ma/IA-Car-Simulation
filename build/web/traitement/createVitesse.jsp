<%-- 
    Document   : createVitesse
    Created on : Feb 7, 2023, 8:45:27 AM
    Author     : i.m.a
--%>

<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="model.Vitesse"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    Vitesse v = new Vitesse();
    v.setVitesse(Double.parseDouble(request.getParameter("vitesse")));
    Type t = new TypeToken<ArrayList<Vitesse>>(){}.getType();
    v.create(new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/vitesse.json"), t);
%>
