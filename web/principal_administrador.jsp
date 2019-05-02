<%-- 
    Document   : principal_administrador
    Created on : 18/04/2019, 09:09:58 PM
    Author     : Usuario
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="newjavascript.js"></script>
    <link rel="stylesheet" href="newcss.css">
    </head>
    
    <%
        HttpSession sesion=request.getSession();
        String user;
        String contra;
        String tipo;
        if(sesion.getAttribute("id")!=null && sesion.getAttribute("pass")!=null ){
            user=sesion.getAttribute("id").toString();
            contra=sesion.getAttribute("pass").toString(); 
            tipo=sesion.getAttribute("tipoU").toString();
        }else{
            %><jsp:forward page="/Welcome.do"/><%
        }
    %>
    
    <body>
        
        <div class="sidebar">
            
            <a href="#informacion" id="myBtnInformacion"> <i class="fa fa-fw fa-user"></i><bean:write name="informacionUsuario" property="nombreUsuario"/></a>
            <a href="#noticias" id="myBtnNoticias"> <i class="fa fa-fw fa-newspaper-o"></i> Noticias</a>
            <a href="#servicios" id="myBtnServicios"> <i class="fa fa-fw fa-building"></i> Servicios</a>
            <a  href="#productos" id="myBtnProductos"> <i class="fa fa-fw fa-buysellads"></i> Productos</a>
            <a href="#usuarios" id="myBtnUsuarios"> <i class="fa fa-fw fa-list"></i> Usuarios</a>
            <a href="./administrador.do?method=salirMenu" id="myBtnSalir" > <i class="fa fa-fw fa-sign-out"></i>Principal</a>
        </div>
        
        <div id="mainInformacion" class="mainInformacion">
            <h2><bean:message key="label.miInformacion"/></h2>
            <img src="./img/ASSET-USER-ADMIN-300x300.png"   width="150" height="150"><br></br>
            <bean:message key="label.miInformacion.nombre"/> <br>
            <bean:write name="informacionUsuario" property="nombreUsuario"/><br></br>
            <bean:message key="label.miInformacion.apellido"/> <br>
            <bean:write name="informacionUsuario" property="apellidoUsuario"/><br></br>
            <bean:message key="label.miInformacion.correo"/> <br>
            <bean:write name="informacionUsuario" property="correoUsuario"/><br></br>
            <bean:message key="label.miInformacion.distrito"/> <br>
            <bean:write name="informacionUsuario" property="distritoUsuario"/><br></br>
            
            <bean:message key="label.miInformacion.contrasena"/> <br>
            <bean:message key="label.miInformacion.contrasena1"/><br></br>
            <a href="./usuario.do?method=modificarUsuario&usuario=<bean:write name="informacionUsuario" property="codigoUsuario"/>">Editar informacion</a>
        </div>
            
        <div id="mainNoticias" class="mainNoticias">
            <h2><bean:message key="label.noticia"/></h2>
            <div id="myNavbarN" class="navbar" >
                <a href="#" class="active" id="myBtnCrearNoticia"><bean:message key="label.crear"/></a>
                <a href="#" id="myBtnBuscarNoticia"><bean:message key="label.buscar"/></a>
                <a href="#" id="myBtnPeticionesNoticia"><bean:message key="label.solicitudes"/></a>
                <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunctionNavbarN()">&#9776;</a>
            </div>
            
            <div id="subCrearNoticia" class="subCrear">
                <h3><bean:message key="label.noticia.crear"/></h3>
                <form action="./administrador.do" method="get">
                    <input type="hidden" name="method"  value="publicarNoticia"> 
                    <bean:message key="label.noticia.titulo"/> <br>
                    <input type="text" name="tituloNoticia"/><br><br>
                    <bean:message key="label.noticia.detalle"/> <br>
                    <textarea name="descripcionNoticia" placeholder="Detalle de la noticia..." style="height:200px"></textarea><br><br>
                    <bean:message key="label.noticia.prioridad"/> <input type="radio" name="prioridadNoticia"/><br><br>
                    <input type="submit" value="Publicar"/>
                </form>
            </div>
            
            <div id="subBuscarNoticia" class="subBuscar" style="overflow-x:auto;">
                <h3><bean:message key="label.noticia.buscar"/></h3>
                <input type="text" id="myInputN" onkeyup="buscarNoticia()" placeholder="Titulo..." title="Type in a name"/>
                <h3><button onclick="sortTableNotice()"><bean:message key="label.buscar"/></button></h3>
                <table id="myTableN">
                    <tr class="header">
                      <th ><bean:message key="label.noticia.codigo"/></th>
                      <th ><bean:message key="label.noticia.user"/></th>
                      <th ><bean:message key="label.noticia.titulo"/></th>
                      <th ><bean:message key="label.noticia.detalle"/></th>
                      <th><bean:message key="label.noticia.prioridad"/></th>
                    </tr>
                    <logic:notEmpty name="listaNoticias">
                        <logic:iterate name="listaNoticias" id="noticiaTemp">
                            <tr>
                                <td><a href="./noticia.do?method=modificarNoticia&codigoNoticia=<bean:write name="noticiaTemp" property="codigoNoticia"/>"><bean:write name="noticiaTemp" property="codigoNoticia"/></a></td>
                                <td><bean:write name="noticiaTemp" property="codigoUsuario"/></td>
                                <td><bean:write name="noticiaTemp" property="tituloNoticia"/></td>
                                <td><bean:write name="noticiaTemp" property="descripcionNoticia"/></td>
                                <td>
                                    <logic:equal name="noticiaTemp" property="prioridadNoticia" value="true"><bean:message key="label.si"/></logic:equal>
                                    <logic:equal name="noticiaTemp" property="prioridadNoticia" value="false"><bean:message key="label.no"/></logic:equal>
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:notEmpty>
                </table>
            </div>
                      <div id="subNpeticiones" class="subPeticiones">
                          <h3>Peticiones de Noticias</h3>
                          
                          <table >
                              <tr>
                                  <th>Titulo</th>
                                  <th>Detalle</th>
                                  <th>Usuario</th>
                                  <th>Aceptar</th>
                                  
                              </tr>
                              <logic:iterate name="listaNoticias" id="listaTemporalNoticias">
                                  <logic:equal name="listaTemporalNoticias" property="estadoNoticia" value="0">
                                      <td><bean:write name="listaTemporalNoticias" property="tituloNoticias"/></td>
                                      <td><bean:write name="listaTemporalNoticias" property="detalleNoticias"/></td>
                                      <td><bean:write name="listaTemporalNoticias" property="codigoUsuario"/></td>
                                      <td><a href="./noticia.do?methodAceptarNoticia"></a></td>
                                  </logic:equal>
                                  
                              </logic:iterate>
                          </table>
                      </div>
        </div>
        
        <div id="mainServicios" class="mainServicios">
            <h2><bean:message key="label.servicios"/></h2>
            <div id="myNavbarS" class="navbar" >
                <a href="#" class="active" id="myBtnCrearServicio"><bean:message key="label.servicio.crear"/></a>
                <a href="#" id="myBtnBuscarServicio"><bean:message key="label.buscar"/></a>
                <a href="#" id="myBtnPeticionesServicio"><bean:message key="label.solicitudes"/></a>
                <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunctionNavbarS()">&#9776;</a>
            </div>
            
            <div id="subCrearServicio" class="subCrear">
                <h3><bean:message key="label.servicio.crear"/></h3>
                <form action="./administrador.do" method="post">
                    <input type="hidden" name="method" value="agregarServicio">
                    <bean:message key="label.servicio.titulo"/><br>
                    <input type="text" name="tituloServicio"/><br><br>
                    <bean:message key="label.servicio.descripcion"/><br>
                    <input type="text" name="detalleServicio"/><br><br>
                    <bean:message key="label.servicio.precio"/><br>
                    <input type="text" name="precioServicio"/><br><br>
                    <bean:message key="label.servicio.expres"/> 
                    <input type="radio" name="expresServicio"/><br><br>
                    <input type="submit" value="Publicar"/>
                </form>
            </div>
            
            <div id="subBuscarServicio" class="subBuscar">
                <h3><bean:message key="label.servicio.buscar"/></h3>
                <input type="text" id="myInputS" onkeyup="myFunctionBuscarServicio()" placeholder="Titulo..." title="Type in a name"/>
                <h3><button onclick="sortTableService()"><bean:message key="label.ordenar"/></button></h3>
                <table id="myTableS">
                    <tr class="header">
                       <th ><bean:message key="label.servicio.codigo"/></th>
                      <th><bean:message key="label.servicio.user"/></th>
                      <th ><bean:message key="label.servicio.titulo"/></th>
                      <th ><bean:message key="label.servicio.precio"/></th>
                      <th ><bean:message key="label.servicio.expres1"/></th>
                    </tr>
                   
                    <logic:notEmpty name="listaServicios">
                        <logic:iterate name="listaServicios" id="servicioTemp">
                            <tr>
                                <td><a href="./servicio.do?method=modificarServicio&servicio=<bean:write name="servicioTemp" property="codigoServicio"/>"/><bean:write name="servicioTemp" property="codigoServicio"/></a></td>
                                <td><bean:write name="servicioTemp" property="codigoUsuario"/></td>
                                <td><bean:write name="servicioTemp" property="tituloServicio"/></td>
                                <td><bean:write name="servicioTemp" property="precioServicio"/></td>
                                <td>
                                    <logic:equal name="servicioTemp" property="expresServicio" value="true"><bean:message key="label.si"/></logic:equal>
                                    <logic:equal name="servicioTemp" property="expresServicio" value="false"><bean:message key="label.no"/></logic:equal>
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:notEmpty>
                </table>
            </div>
            
                    <div id="subSpeticiones" class="subPeticiones">
                          <h3>Peticiones de servicios</h3>
                          
                          
                      </div>
            
        </div>
        
        <div id="mainProductos" class="mainProductos">
            <h2><bean:message key="label.producto"/></h2>
            <div id="myNavbarP" class="navbar" >
                <a href="#" class="active" id="myBtnCrearProducto"><bean:message key="label.producto.crear"/></a>
                <a href="#" id="myBtnBuscarProducto"><bean:message key="label.buscar"/></a>
                <a href="#" id="myBtnPeticionesProducto"><bean:message key="label.solicitudes"/></a>
                <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunctionNavbarP()">&#9776;</a>
            </div>
            
            <div id="subCrearProducto" class="subCrear">
                <h3><bean:message key="label.producto.crear"/></h3>
                <form action="./administrador.do" method="post">
                    <input type="hidden" name="method" value="agregarProducto">
                    <bean:message key="label.producto.titulo"/> <br>
                    <input type="text" name="tituloProducto" required="true"/><br><br>
                    <bean:message key="label.producto.detalle"/> <br>
                    <input type="text" name="detalleProducto" required="true"/><br><br>
                    <bean:message key="label.producto.precio"/> <br>
                    <input type="text" name="precioProducto" required="true"/><br><br>
                    <bean:message key="label.producto.expres"/>  
                    <input type="radio" name="expresProducto" value="s" /><br><br>
                    <bean:message key="label.producto.tipo"/> <br>
                    <select name="tipoProducto" required="true">
                        <option value="tecnologia"><bean:message key="label.producto.tipo.tecnologia"/></option>
                        <option value="accesorios"><bean:message key="label.producto.tipo.accesorios"/></option>
                        <option value="otros"><bean:message key="label.producto.tipo.otros"/></option>
                    </select><br><br>
                    <input type="submit" value="Publicar"/>
                </form>
            </div>
            <div id="subBuscarProducto" class="subBuscar">
                <h3><bean:message key="label.producto.buscar"/></h3>
                <input type="text" id="myInputP" onkeyup="buscarProducto()" placeholder="Titulo..." title="Type in a name"/>
                <h3><button onclick="sortTableProduct()"><bean:message key="label.ordenar"/></button></h3>
                <table id="myTableP">
                    <tr class="header">
                      <th > <bean:message key="label.producto.codigo"/></th>
                      <th > <bean:message key="label.producto.user"/></th>
                      <th > <bean:message key="label.producto.titulo"/></th>
                      <th > <bean:message key="label.producto.tipo"/></th>
                      <th > <bean:message key="label.producto.precio"/></th>
                      <th > <bean:message key="label.producto.expres1"/></th>
                    </tr>
                   
                    <logic:notEmpty name="listaProductos">
                        <logic:iterate name="listaProductos" id="productoTemp">
                            <tr>
                                <td><a href="./producto.do?method=modificarProducto&producto=<bean:write name="productoTemp" property="codigoProducto"/>"/><bean:write name="productoTemp" property="codigoProducto"/></a></td>
                                <td><bean:write name="productoTemp" property="codigoUsuario"/></td>
                                <td><bean:write name="productoTemp" property="tituloProducto"/></td>
                                <td><bean:write name="productoTemp" property="tipoProducto"/></td>
                                <td><bean:write name="productoTemp" property="precioProducto"/></td>
                                <td>
                                    <logic:equal name="productoTemp" property="expresProducto" value="true"><bean:message key="label.si"/></logic:equal>
                                    <logic:equal name="productoTemp" property="expresProducto" value="false"><bean:message key="label.no"/></logic:equal>
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:notEmpty>
                </table>
            </div>
                    
                    <div id="subPpeticiones" class="subPeticiones">
                          <h3>Peticiones de Productos</h3>
                          
                      </div>
        </div>
        
        <div id="mainUsuarios" class="mainUsuarios">
            <h2><bean:message key="label.usuarios"/></h2>
            <div id="myNavbarU" class="navbar" >
                <a href="#" class="active" id="myBtnCrearUsuario"><bean:message key="label.crear"/></a>
                <a href="#" id="myBtnBuscarUsuario"><bean:message key="label.buscar"/></a>
                <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunctionNavbarU()">&#9776;</a>
            </div>
            
            <div id="subCrearUsuario" class="subCrear">
                <h3><bean:message key="label.usuarios.crear"/></h3>
                <form action="./administrador.do" method="post">
                    <input type="hidden" name="method" value="registrarUsuario">
                    <bean:message key="label.usuarios.nombre"/>  
                    <br><input type="text" name="nombreUsuario" autocomplete="off"/><br><br>
                    <bean:message key="label.usuarios.apellidos"/>
                    <br><input type="text" name="apellidosUsuario" autocomplete="off"/><br><br>
                    <bean:message key="label.usuarios.correo"/>
                    <br><input type="text" name="correoUsuario" autocomplete="off"/><br><br>
                    <bean:message key="label.usuarios.clave"/>
                    <br><input type="text" name="claveUsuario" autocomplete="off"/><br><br>
                    <bean:message key="label.usuarios.distrito"/>
                    <br><input type="text" name="distritoUsuario" autocomplete="off"/><br><br>
                    <bean:message key="label.usuarios.tipo"/>
                    <br>
                    <select name="tipoProducto" required="true">
                        <option value="Administrador"><bean:message key="label.usuarios.administrador"/></option>
                        <option value="Cliente"><bean:message key="label.usuarios.cliente"/></option>
                    </select><br><br>
                    <input type="submit" value="Registrar"/>
                </form>
            </div>
            
            <div id="subBuscarUsuario" class="subBuscar">
                <h3><bean:message key="label.usuarios.buscar"/></h3>
                <input type="text" id="myInputU" onkeyup="myFunctionBuscarUsuario()" placeholder="Search for names.." title="Type in a name"/>
                <h3><button onclick="sortTableUser()"><bean:message key="label.ordenar"/></button></h3>
                <table id="myTableU">
                    <tr class="header">
                        <th ><bean:message key="label.usuarios.codigo"/></th>
                      <th ><bean:message key="label.usuarios.nombre"/></th>
                      <th ><bean:message key="label.usuarios.apellidos"/></th>
                      <th ><bean:message key="label.usuarios.tipo"/></th>
                    </tr>
                        <logic:notEmpty name="listaUsuarios">
                            <logic:iterate name="listaUsuarios" id="usuarioTemp">
                                <tr>
                                    <td><a href="./usuario.do?method=modificarUsuario&usuario=<bean:write name="usuarioTemp" property="codigoUsuario"/>"><bean:write name="usuarioTemp" property="codigoUsuario"/></a></td>
                                    <td><bean:write name="usuarioTemp" property="nombreUsuario"/></td>
                                    <td><bean:write name="usuarioTemp" property="apellidoUsuario"/></td>
                                    <td><bean:write name="usuarioTemp" property="tipoUsuario"/></td>
                                </tr>
                            </logic:iterate>
                        </logic:notEmpty>
                </table>
            </div>
        </div>   
        
        <script>
            var mynavbarN = document.getElementById("myNavbarN");
            function myFunctionNavbarN() {
              if (mynavbarN.className === "navbar") {
                mynavbarN.className += " responsive";
              } else {
                mynavbarN.className = "navbar";
              }
            }
        </script>
        
         <script>
            var mynavbarP = document.getElementById("myNavbarP");
            function myFunctionNavbarP() {
              if (mynavbarP.className === "navbar") {
                mynavbarP.className += " responsive";
              } else {
                mynavbarP.className = "navbar";
              }
            }
        </script>
        
         <script>
            var mynavbarS = document.getElementById("myNavbarS");
            function myFunctionNavbarS() {
              if (mynavbarS.className === "navbar") {
                mynavbarS.className += " responsive";
              } else {
                mynavbarS.className = "navbar";
              }
            }
        </script>
         <script>
            var mynavbarU = document.getElementById("myNavbarU");
            function myFunctionNavbarU() {
              if (mynavbarU.className === "navbar") {
                mynavbarU.className += " responsive";
              } else {
                mynavbarU.className = "navbar";
              }
            }
        </script>
        <script>
            var mainU = document.getElementById('mainUsuarios');
            var btnU = document.getElementById("myBtnUsuarios");
            
            var subCU = document.getElementById('subCrearUsuario');
            var btnSCU = document.getElementById("myBtnCrearUsuario");
            
            var subBU = document.getElementById('subBuscarUsuario');
            var btnSBU = document.getElementById("myBtnBuscarUsuario");
        </script>
        
        <script>
            var mainN = document.getElementById('mainNoticias');
            var btnN = document.getElementById("myBtnNoticias");
            
            var subCN = document.getElementById('subCrearNoticia');
            var btnSCN = document.getElementById("myBtnCrearNoticia");
            
            var subBN = document.getElementById('subBuscarNoticia');
            var btnSBN = document.getElementById("myBtnBuscarNoticia");
            
            var btnPN = document.getElementById("myBtnPeticionesNoticia");
        </script>
        <script>
            var mainS = document.getElementById('mainServicios');
            var btnS = document.getElementById("myBtnServicios");
            
            var subCS = document.getElementById('subCrearServicio');
            var btnSCS = document.getElementById("myBtnCrearServicio");
            
            var subBS = document.getElementById('subBuscarServicio');
            var btnSBS = document.getElementById("myBtnBuscarServicio");
            
            var btnPS= document.getElementById("myBtnPeticionesServicio");
        </script>
        
        <script>
            var mainP = document.getElementById('mainProductos');
            var btnP = document.getElementById("myBtnProductos");
            
            var subCP = document.getElementById('subCrearProducto');
            var btnSCP = document.getElementById("myBtnCrearProducto");
            
            
            var subBP = document.getElementById('subBuscarProducto');
            var btnSBP = document.getElementById("myBtnBuscarProducto");
            
            var btnPP = document.getElementById("myBtnPeticionesProducto");
        </script>
        <script>
            var mainInformacion = document.getElementById("mainInformacion");
            var btnInformacion = document.getElementById("myBtnInformacion");
        </script>
        <script>
            btnInformacion.onclick = function(){actionMainInformacion();};
        </script>
        <script>
            btnN.onclick = function(){actionMainNoticia();};
        </script>
        <script>
            btnPN.onclick = function(){actionPeticionNoticia();};
        </script>
        <script>
            btnPS.onclick = function(){actionPeticionServicio();};
        </script>
        <script>
            btnPP.onclick = function(){actionPeticionProducto();};
        </script>
        <script>
            btnS.onclick = function() {actionMainServicio();};
        </script>
         <script>
            btnP.onclick = function() {actionMainProducto();};
        </script>
        <script>
            btnU.onclick = function() {actionMainUsuarios();};
        </script>
        
        <script>
            btnSCN.onclick = function() {actionCrearNoticia();};
        </script>
        <script>
            btnSBN.onclick = function() {actionBuscarNoticia();};
        </script>
       
        <script>
            btnSCP.onclick = function() {actionCrearProducto();};
        </script>
        
        <script>
            btnSBP.onclick = function() {actionBuscarProducto();};
        </script>
        <script>
            btnSCS.onclick = function() {actionCrearServicio();};
        </script>
        
        <script>
            btnSBS.onclick = function() {actionBuscarServicio();};
        </script>
       
        <script>
            btnSCU.onclick = function() {actionCrearUsuario();};
        </script>
        <script>
            btnSBU.onclick = function() {actionBuscarUsuario();};
        </script>
    </body>
</html> 