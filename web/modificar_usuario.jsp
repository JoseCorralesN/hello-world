<%-- 
    Document   : modificar_usuario
    Created on : 22/04/2019, 02:22:47 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR USUARIO</title>
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
        <h1>Modificar Usuario</h1>

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
        %><logic:notEmpty name="usuario">
            <form action="./usuario.do" method="post">
                <input type="hidden" name="method" value="modificar">
                <input type="hidden" name="codigoUsuario" value="<bean:write name="usuario" property="codigoUsuario"/>">
                Nombre:  <br><input type="text" name="nombreUsuario" value="<bean:write name="usuario" property="nombreUsuario"/>"/><br><br>
                Apellidos:  <br><input type="text" name="apellidosUsuario" value="<bean:write name="usuario" property="apellidoUsuario"/>"/><br><br>
                Correo:  <br><input type="text" name="correoUsuario" value="<bean:write name="usuario" property="correoUsuario"/>"/><br><br>
                Clave:  <br><input type="text" name="claveUsuario" value="<bean:write name="usuario" property="contrasenaUsuario"/>"/><br><br>
                Distrito:  <br>
                <select id="distrito" name="distritoUsuario">
                      <option value="puertoviejo">Puerto Viejo</option>
                      <option value="lavirgen">La Virgen</option>
                      <option value="horquteas">Horquetas</option>
                      <option value="curena">Cureña</option>
                      <option value="llanurasdelgaspar">Llanuras del Gaspar</option>
                      <option value="otro" selected>Otro</option>
                </select>
                <br><br>
                
                
                <logic:notEqual name="usuario" property="codigoUsuario" value="<%=user%>">
                  Tipo:  <br>
                  <select id="distrito" name="distrito">
                      <option value="Administrador">Administrador</option>
                      <option value="Cliente">Cliente</option>
                  </select>
                  <br><br>
                  <p><a href="./usuario.do?method=eliminar&cod=<bean:write name="usuario" property="codigoUsuario"/>">Eliminar</a></p>
                </logic:notEqual>
                <input type="submit" value="Guardar"/>
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
