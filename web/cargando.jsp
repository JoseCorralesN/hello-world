<%-- 
    Document   : cargando
    Created on : 23/04/2019, 08:29:25 PM
    Author     : Usuario
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redireccionando...</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession();
            String user;
            String contra;
            String tipo;
            if(sesion.getAttribute("id")!=null && sesion.getAttribute("pass")!=null ){
               user=sesion.getAttribute("id").toString();
               contra=sesion.getAttribute("pass").toString();
               tipo=sesion.getAttribute("tipoU").toString();
               if(tipo.equals("Administrador")){
                   %><jsp:forward page="/administrador.do?method=inicio"/><%
               }else{
                   %><jsp:forward page="/principal.do?method=inicio"/><%
               }
               %><%
               
            }else{
                %><jsp:forward page="/principal.do"/><%
            }
                
            %>
            
            
    </body>
</html>
