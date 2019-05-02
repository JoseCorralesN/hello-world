<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICAR SERVICIO</title> 
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
        <h1>Modificar Servicio</h1>
       
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
        %><logic:notEmpty name="servicio">
                    <form action="./servicio.do" method="post">
                        <input type="hidden" name="method" value="modificar">
                        <input type="hidden" name="codigoServicio" value="<bean:write name="servicio" property="codigoServicio"/>"/>
                        <input type="hidden" name="codigoUsuario" value="<bean:write name="servicio" property="codigoUsuario"/>"/>
                        Titulo:<br><input type="text" name="tituloServicio" value="<bean:write name="servicio" property="tituloServicio"/>"/><br><br>
                        Detalle:<br><input type="text" name="descripcionServicio" value="<bean:write name="servicio" property="descripcionServicio"/>"/><br><br>
                        Precio:<br><input type="text" name="precioServicio" value="<bean:write name="servicio" property="precioServicio"/>"/><br><br>
                        Expres:<br><input type="radio" name="expresServicio" value="<bean:write name="servicio" property="expresServicio"/>"/><br><br>
                        <input type="hidden" name="fechaServicio" value="<bean:write name="servicio" property="fechaServicio"/>"/>
                        <input type="hidden" name="horaServicio" value="<bean:write name="servicio" property="horaServicio"/>"/>

                        <input type="submit" value="Modificar"/>
                        <p><a href="./servicio.do?method=eliminar&cod=<bean:write name="servicio" property="codigoServicio"/>">Eliminar</a></p>
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