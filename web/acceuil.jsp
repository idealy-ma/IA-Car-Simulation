<%-- 
    Document   : acceuil
    Created on : Feb 4, 2023, 8:43:15 PM
    Author     : i.m.a
--%>
<%@page import="model.Configuration"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Utilisateur" %>
<%
    Utilisateur u = (Utilisateur) session.getAttribute("user");
    ArrayList<Configuration> configurations = u.getListeConfiguration(null);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/index.css"/>
        <link rel="stylesheet" href="assets/css/acceuil.css"/>
        <title>Voiture</title>
    </head>
    <body>
        <h1 class="greeting">Bienvenue sur Tesla-Car-Simulator</h1>
        <div class="car">   
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
                            <h4><%= configuration.getConfig() %></h4>
                        </div>
                        <p><%= configuration.getValeur() %></p>
                    </div>
                <%  } %>
            </div>
            
            <div class="vehicle-info">
                <h3>Information du vehicule</h3>
                <div class="card-info">
                    <div class="card-header">
                        <h4>Kilometrage (km)</h4>
                    </div>
                    <p>24 km</p>
                </div>
                
                <div class="card-info">
                    <div class="card-header">
                        <h4>Consomation (w/h)</h4>
                    </div>
                    <p>1200 Wh</p>
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
    </body>
</html>
