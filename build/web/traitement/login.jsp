<%-- 
    Document   : login
    Created on : Feb 4, 2023, 8:41:51 PM
    Author     : i.m.a
--%>
<%@page import="model.Utilisateur" %>
<%
    // Login traitement ensuite
    // redirection vers l'acceuil.jsp avec l'id utilisateur
    Utilisateur u = new Utilisateur();
    u.setLogin(request.getParameter("login"));
    u.setMotdepasse(request.getParameter("password"));
    
    if(u.login()){
        session.setAttribute("user", u);
        response.sendRedirect("../acceuil.jsp");
    } else {
        response.sendRedirect("../index.html");
    }
%>