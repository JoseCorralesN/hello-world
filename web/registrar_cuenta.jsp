<%-- 
    Document   : registrar_cuenta
    Created on : 20/03/2019, 06:14:05 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<!DOCTYPE html>
<html:html lang="true">
    <head>
    
        <link rel="stylesheet" href="/css.do" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <html:base/>
    
    
        <style>
            * {
                box-sizing: border-box;
            }

            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }

            label {
                padding: 12px 12px 12px 0;
                display: inline-block;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: right;
            }

            input[type=submit]:hover {
                 background-color: #45a049;
            }

            .container {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }

            .col-25 {
                float: left;
                width: 25%;
                margin-top: 6px;
            }

            .col-75 {
                float: left;
                width: 75%;
                margin-top: 6px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 600px) {
                .col-25, .col-75, input[type=submit] {
                    width: 100%;
                    margin-top: 0;
                }
            }
        </style>
    </head>
    <body>

        <h2><bean:message key="welcome.title"/></h2>
        <p><bean:message key="label.crearCuenta"/></p>

        <div class="container">
          <form action="./usuario.do" method="post">
            <input type="hidden" name="method" value="registrar"/>

            <div class="row">
              <div class="col-25">
                <label for="nombre">Nombre: </label>
              </div>
              <div class="col-75">
                <input type="text" id="nombre" name="nombre" placeholder="Su nombre...">
              </div>
            </div>
            <div class="row">
              <div class="col-25">
                <label for="apellidos">Apellidos: </label>
              </div>
              <div class="col-75">
                <input type="text" id="apellidos" name="apellidos" placeholder="Apellidos...">
              </div>
            </div>
            <div class="row">
              <div class="col-25">
                <label for="correo">Correo: </label>
              </div>
              <div class="col-75">
                <input type="text" id="correo" name="correo" placeholder="example@gmail.com">
              </div>
            </div>
                <div class="row">
              <div class="col-25">
                <label for="pass">Contraseña </label>
              </div>
              <div class="col-75">
                <input type="text" id="pass" name="pass" placeholder="example123">
              </div>
            </div>
            <div class="row">
              <div class="col-25">
                <label for="distrito">Distrito: </label>
              </div>
              <div class="col-75">
                 <select id="distrito" name="distrito">
                      <option value="puertoviejo">Puerto Viejo</option>
                      <option value="lavirgen">La Virgen</option>
                      <option value="horquteas">Horquetas</option>
                      <option value="curena">Cureña</option>
                      <option value="llanurasdelgaspar">Llanuras del Gaspar</option>
                      <option value="otro" selected>Otro</option>
                </select>
              </div>
            </div><br>
            <div class="row">
              <input type="submit" value="Registrarse">
            </div>
          </form>
        </div>

    </body>
</html:html>
