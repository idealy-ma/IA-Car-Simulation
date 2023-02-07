<%-- 
    Document   : acceuil
    Created on : Feb 4, 2023, 8:43:15 PM
    Author     : i.m.a
--%>
<%@page import="java.io.File"%>
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
    v = (Vehicule) v.find(new File("/home/i.m.a/Documents/GitHub/IA-Car-Simulation/src/java/base.sql"));
    v.setU((Utilisateur) session.getAttribute("user"));
    double vitesse = 0;
    if(request.getParameter("vitesse")!=null){
        vitesse = Double.parseDouble(request.getParameter("vitesse"));
    }
    
    v.setVitesse(vitesse);
    
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
                    top:<%= c.getDefaultY() %>px;
                    left:<%= c.getDefaultX() %>px;
                } to {
                    top:<%= c.getPosY() %>px;
                    left:<%= c.getPosX() %>px;
                }
            }
        </style>
        <title>Voiture</title>
    </head>
    <body>
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
                        <h4>Vitesse (km/s)</h4>
                    </div>
                    <p><span id="vitesse"><%= v.getVitesse()%></span> km/s</p>
                </div>
                
                <div class="card-info">
                    <div class="card-header">
                        <h4>Consomation (W/km/s)</h4>
                    </div>
                    <p><%= v.getConsomation() %>km/s</p>
                </div>
                
                <div class="card-info">
                    <div class="card-header">
                        <h4>Battery (W)</h4>
                    </div>
                    <p><%= v.getBattery()%> W</p>
                </div>
                
                <div class="card-info">
                    <div class="card-header">
                        <h4>Autonomie (W)</h4>
                    </div>
                    <p><span id="autonomie"><%= v.getAutonomie()%></span> W</p>
                </div>
            </div>
            
            <div>
                <div class="card-header">
                    <h2>Accelerer</h2>
                </div>
                <p>Ce formuliaire vous permet d'accelerer votre vehicule.</p>
                <p>Inserer juste la valeur en <b>Km</b> la distance que vous voulez aller.</p>
                <p id='gfg'>GFG</p>
                <button onclick="startTimer(<%= v.getVitesse() %>)">
                    Accelerer
                </button>

                <button onclick="stopTimer()">
                    Stop
                </button>
            </div>
        </div>
        <script>
            const element = document.getElementById("chaise");
            element.style = "animation: depl 1 2s; top:<%= c.getPosY() %>px; left:<%= c.getPosX() %>px;";
            
            var timer;
            
            getInformation();
            
            function getInformation(){
                let xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState === 4 && this.status === 200) {
                        document.getElementById("autonomie").innerHTML = JSON.parse(this.responseText).autonomie;
                        document.getElementById("vitesse").innerHTML = JSON.parse(this.responseText).vitesse;
                    }
                }
                xmlhttp.open("GET", "http://localhost:9000/Tesla-Car-Simulation/traitement/information.jsp");
                xmlhttp.send();
            }
            
            function insertVitesse(vitesse){
                let xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "http://http://localhost:9000/Tesla-Car-Simulation/traitement/createVitesse.jsp?vitesse="+vitesse);
                xmlhttp.send();
            }
      
            function startTimer(vitesse) {
                let augmentation = 10;
                // Insertion du vitesse dans json vitess.json (appel web service insert vitesse)
                timer = setInterval(function() { 
                    let vit = parseFloat(<%= v.getVitesse() %>)+parseFloat(augmentation);
                    console.log(vit);
                    insertVitesse();
                }, 1000);

            }
            
            function stopTimer() {
                document.getElementById('vitesse')
                        .innerHTML = 0;
                clearInterval(timer); 
            }
        </script>
    </body>
</html>
