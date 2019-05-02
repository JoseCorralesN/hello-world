<%-- 
    Document   : modificar_usuario
    Created on : 22/04/2019, 02:22:47 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR NOTICIA</title>
    <style>
        input[type=text], select {
  width: 50%;
  padding: 6px 12px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 2px;
  box-sizing: border-box;
  
 

}
 input[type=submit] {
  width: 50%;
  background-color: #45a049;
  color: black;
  padding: 6px 12px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #255625;
}
h1 {
  text-transform: uppercase;
  color: #4CAF50;
}
    </style>
    </head>
    <body>
        <h1>Modificar Noticia</h1>
        
        
        
        <%
            HttpSession sesion = request.getSession();
            String user;
            String contra;
            String tipo;
            if (sesion.getAttribute("id") != null && sesion.getAttribute("pass") != null) {
                user = sesion.getAttribute("id").toString();
                contra = sesion.getAttribute("pass").toString();
                tipo = sesion.getAttribute("tipoU").toString();
                if (tipo.equals("Administrador")) {
        %><logic:notEmpty name="noticia">
                    <form action="./noticia.do" method="post">
                        <input type="hidden" name="method" value="modificar">
                         <input type="hidden" name="estadoNoticia" value="<bean:write name="noticia" property="estadoNoticia"/>"/>
                        <input type="hidden" name="codigoUsuario" value="<bean:write name="noticia" property="codigoUsuario"/>"/>
                        <input type="hidden" name="codigoNoticia" value="<bean:write name="noticia" property="codigoNoticia"/>"/>
                        Titulo:  <input type="text" name="tituloNoticia" value="<bean:write name="noticia" property="tituloNoticia"/>"/><br><br>
                        Detalle:  <textarea name="descripcionNoticia" value="<bean:write name="noticia" property="descripcionNoticia"/>" style="height:200px"></textarea><br><br>
                          <input type="hidden" name="fechaNoticia" value="<bean:write name="noticia" property="fechaNoticia"/>"/><br><br>
                          <input type="hidden" name="horaNoticia" value="<bean:write name="noticia" property="horaNoticia"/>"/><br><br>
                          <input type="hidden" name="prioridadNoticia" value="<bean:write name="noticia" property="prioridadNoticia"/>"/><br><br>
                        <input type="submit" value="Modificar"/>
                        <p><a href="./noticia.do?method=eliminar&cod=<bean:write name="noticia" property="codigoNoticia"/>">Eliminar</a></p>
                    </form>
            </logic:notEmpty><%
            }
        %><%
           } else {
        %><jsp:forward page="/principal.do"/><%
                }

        %>

    </body>
</html>