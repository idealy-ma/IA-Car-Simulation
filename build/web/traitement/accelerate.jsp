<%-- 
    Document   : accelerate
    Created on : Feb 5, 2023, 8:35:10 PM
    Author     : i.m.a
--%>
<%@page import="model.Kilometrage"%>
<%
    Kilometrage km = new Kilometrage();
    km.setValeur(Double.parseDouble(request.getParameter("vitesse")));
    km.create(null);
    response.sendRedirect("../acceuil.jsp");
%>
