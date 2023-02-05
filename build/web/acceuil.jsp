<%-- 
    Document   : acceuil
    Created on : Feb 4, 2023, 8:43:15 PM
    Author     : i.m.a
--%>
<%@page import="model.Chaise"%>
<%@page import="model.Vehicule"%>
<%@page import="model.Configuration"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Utilisateur" %>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("index.html");
    }
    
    Vehicule v = new Vehicule();
    v.find(null);
    v.setU((Utilisateur) session.getAttribute("user"));
    
    Chaise c = v.getU().getPreferenceChaise(null);
    ArrayList<Configuration> configurations = v.getU().getListeConfiguration(null);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/index.css"/>
        <link rel="stylesheet" href="assets/css/acceuil.css"/>
        <style>
            @keyframes depl{
                from{
                    top:<%= c.getDefaultX() %>px;
                    left:<%= c.getDefaultY() %>px;
                } to {
                    top:<%= c.getPosY() %>px;
                    left:<%= c.getPosX() %>px;
                }
            }
        </style>
        <title>Voiture</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <h1 class="greeting">Bienvenue sur Tesla-Car-Simulator</h1>
        <div class="car">
            <div class="chaise" id="chaise">
            </div>
        </div>
        
        <div class="information">
            <div class="card-header">
                <h2>Configuration du vehicule</h2>
            </div>
            <div class="user-pref">
                <h3>Information du preference utilisateur</h3>
                <% for (Configuration configuration : configurations) { %>
                    <div class="card-info">
                        <div class="card-header">
                            <h4><%= configuration.getConfig() %> (deg)</h4>
                        </div>
                        <p><%= configuration.getValeur() %> deg</p>
                    </div>
                <%  } %>
            </div>
            
            <div class="vehicle-info">
                <h3>Information du vehicule</h3>
                <div class="card-info">
                    <div class="card-header">
                        <h4>Kilometrage (km)</h4>
                    </div>
                    <p><%= v.getKilometrage() %> km</p>
                </div>
                
                <div class="card-info">
                    <div class="card-header">
                        <h4>Consomation (W)</h4>
                    </div>
                    <p><%= v.getConsomation() %> W</p>
                </div>
            </div>
            
            <div>
                <div class="card-header">
                    <h2>Accelerer</h2>
                </div>
                <p>Ce formuliaire vous permet d'accelerer votre vehicule.</p>
                <p>Inserer juste la valeur en <b>Km</b> la distance que vous voulez aller.</p>
                <form class="form" action="traitement/accelerate.jsp" method="post">
                    <div class="form-control">
                        <input type="number" name="vitesse" placeholder="6 km">
                    </div>
                    <div class="form-control">
                        <input class="form-btn" type="submit" value="Accelerer">
                    </div>
                </form>
            </div>
        </div>
        <script>
            const element = document.getElementById("chaise");
            element.style = "animation: depl 1 2s; top:<%= c.getPosY() %>px; left:<%= c.getPosX() %>px;";
        </script>
    </body>
</html>
