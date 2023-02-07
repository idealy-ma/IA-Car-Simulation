<%-- 
    Document   : information
    Created on : Feb 7, 2023, 7:55:52 AM
    Author     : i.m.a
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="model.Configuration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Chaise"%>
<%@page import="java.io.File"%>
<%@page import="model.Vehicule"%>
<%@page import="model.Utilisateur"%>

<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("index.html");
    }
    
    Vehicule v = new Vehicule();
    v = (Vehicule) v.find(null);
    v.setU((Utilisateur) session.getAttribute("user"));
    double vitesse = 0;
    if(request.getParameter("vitesse")!=null){
        vitesse = Double.parseDouble(request.getParameter("vitesse"));
    }
    
    v.setVitesse(vitesse);
    v.getConsomation();
    v.getAutonomie();
    Gson gson = new Gson();
    out.print(gson.toJson(v));
%>