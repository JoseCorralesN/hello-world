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
        <h1>Modificar Producto</h1>
       
            
         
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
        %><logic:notEmpty name="producto">
                    <form action="./producto.do" method="post">
                        <input type="hidden" name="method" value="modificar">
                        <input type="hidden" name="codUsuario" value="<bean:write name="producto" property="codigoUsuario"/>"/>                        
                        <input type="hidden" name="codigoProducto" value="<bean:write name="producto" property="codigoProducto"/>"/>
                        Titulo: <br><input type="text" name="tituloProducto" value="<bean:write name="producto" property="tituloProducto"/>"/><br><br>
                        Tipo: <br>
                        <select name="tipoProducto" required="true">
                        <option value="tecnologia"><bean:message key="label.producto.tipo.tecnologia"/></option>
                        <option value="accesorios"><bean:message key="label.producto.tipo.accesorios"/></option>
                        <option value="otros"><bean:message key="label.producto.tipo.otros"/></option>
                        </select><br><br>
                        Detalle: <br><input type="text" name="detalleProducto" value="<bean:write name="producto" property="detalleProducto"/>"/><br><br>
                        Precio: <br><input type="text" name="precioProducto" value="<bean:write name="producto" property="precioProducto"/>"/><br><br>
                        Expres: <br><input type="radio" name="expresProducto" value="<bean:write name="producto" property="expresProducto"/>"/><br><br>
                        <input type="hidden" name="fechaProducto" value="<bean:write name="producto" property="fechaProducto"/>"/>
                        <input type="hidden" name="horaProducto" value="<bean:write name="producto" property="horaProducto"/>"/>

                        <input type="submit" value="Modificar"/>
                        <p><a href="./producto.do?method=eliminar&cod=<bean:write name="producto" property="codigoProducto"/>">Eliminar</a></p>
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