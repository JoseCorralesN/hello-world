<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <link rel="stylesheet" href="/css.do" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <link rel="stylesheet" href="newcss2.css">
        <script type="text/javascript" src="newjavascript2.js"></script>

        <html:base/>
    </head>
    <body>
        <%
        HttpSession sesion=request.getSession();
        String user;
        String contra;
        String tipo;
        String salir="";
        if(sesion.getAttribute("id")!=null && sesion.getAttribute("pass")!=null ){
            user=sesion.getAttribute("id").toString();
            contra=sesion.getAttribute("pass").toString(); 
            tipo=sesion.getAttribute("tipoU").toString();
            salir=sesion.getAttribute("singOut").toString();
            JOptionPane.showMessageDialog(null, sesion.getAttribute("id").toString());
            if(salir!=null){
               if(salir.equals("salir")){
                   JOptionPane.showMessageDialog(null, "invalidando");
                   sesion.invalidate();
                 }else{
                   JOptionPane.showMessageDialog(null, salir);
                 }
            }else{
                JOptionPane.showMessageDialog(null, "es null");
            }
        }
    %>
        
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>
        
        <div id="myModal" class="modal"> 
            <form class="modal-content animate" action="./principal.do" method="post">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                    <img src="img_avatar2.png" alt="Avatar" class="avatar">
                </div>

                <div class="container">
                    <label for="uname"><b>Username</b></label>
                    <input type="hidden" name="method" value="login">
                    <input type="text" placeholder="Enter Username" name="user" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="pass" required>

                    <button type="submit">Login</button>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container" style="background-color:#f1f1f1">
                    <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                    <span class="psw">Forgot <a href="#">password?</a></span>
                </div>
            </form>
        </div>
        
        <div id="header">
            <h2>Scroll Down</h2>
            <p>Scroll down to see the sticky effect.</p>
        </div>
        
        <div class="topnav">
            <a class="active" href="#noticias" id="myBtnNoticias" class="fa fa-fw fa-home"> Noticias</a>
            <div class="dropdown"><button class="dropbtn"> <i class="fa fa-fw fa-buysellads"></i> Productos</button>
                <div class="dropdown-content">
                    <logic:notEmpty name="user">
                        <a href="#">Vender</a>
                    </logic:notEmpty>
                    <a href="#producto" id="myBtnProductos">Comprar</a>
                </div>
            </div> 
            <div class="dropdown"><button class="dropbtn"> <i class="fa fa-fw fa-building"></i> Servicios</button>
                <div class="dropdown-content">
                    <logic:notEmpty name="user">
                        <a href="#">Vender</a>
                    </logic:notEmpty>
                    <a href="#servicio" id="myBtnServicios">Comprar</a>
                </div>
            </div> 
            <a href="#"> <i class="fa fa-fw fa-user"></i>Integrantes</a>
            
            <logic:empty name="user">
               <div class="dropdown">
                    <button class="dropbtn" > <i class="fa fa-fw fa-user"></i> Iniciar Sesion</button>
                    <div class="dropdown-content">
                        <a id="myBtn">INICIAR SESIÓN</a>
                        <a href="./registrar_cuenta.do">REGISTRARSE</a>
                    </div>
                </div>
            </logic:empty>
            <logic:notEmpty name="user">
                 <a href="#">Hola</a>
            </logic:notEmpty>
            <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction2()">&#9776;</a>
        </div>
        
        <div id="mainNoticias" class="mainNoticias">
            <h2><bean:message key="label.noticia"/></h2>
            <logic:notEmpty name="user">
                <form action="./noticia.do?method=publicar" method="post">
                    Titulo: <input type="text" name="tituloNoticia"/><br><br>
                    Detalle: <textarea name="descripcionNoticia" placeholder="Detalle de la noticia..." style="height:200px"></textarea><br><br>
                    <input type="submit" value="Publicar"/>
                </form>
            </logic:notEmpty>
            <logic:notEmpty name="listaNoticias">
                <logic:iterate name="listaNoticias" id="noticiaTemp">
                    <div class="article">
                    <h3><bean:write name="noticiaTemp" property="tituloNoticia"/></h3>
                    <p><bean:write name="noticiaTemp" property="descripcionNoticia"/></p>
                    </div>
                </logic:iterate>
            </logic:notEmpty>
        </div>
       
        <div id="mainProductos" class="mainProductos">
            <logic:notEmpty name="user">
                <form action="./producto.do?method=publicar" method="post">
                    
                </form>
            </logic:notEmpty>
            <h2><bean:message key="label.producto"/></h2>
            <logic:notEmpty name="listaProductos">
                <logic:iterate name="listaProductos" id="productoTemp">
                    <div class="article">
                    <h3><bean:write name="productoTemp" property="tituloProducto"/></h3>
                    <p><bean:write name="productoTemp" property="detalleProducto"/></p>
                    </div>
                </logic:iterate>
            </logic:notEmpty>
        </div>  
            
        <div id="mainServicios" class="mainServicios">
            <logic:notEmpty name="user">
                <form action="./servicio.do?method=publicar" method="post">
                    
                </form>
            </logic:notEmpty>
            <h2><bean:message key="label.servicios"/></h2>
            <logic:notEmpty name="listaServicios">
                <logic:iterate name="listaServicios" id="servicioTemp">
                    <div class="article">
                    <h3><bean:write name="servicioTemp" property="tituloServicio"/></h3>
                    <p><bean:write name="servicioTemp" property="descripcionServicio"/></p>
                    </div>
                </logic:iterate>
            </logic:notEmpty>
        </div>
        <%
            if(salir!=null){
                if(salir.equals("noSalir")){
            JOptionPane.showMessageDialog(null,"sigue la sesion");
        %><a href="./principal.do?method=singOut">Cerrar Sesion</a><%
        }
}%>
            
        
            
            
        <script>
            // Get the modal
            var modal = document.getElementById('myModal');
            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");
            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function() {
                modal.style.display = "block";
            };

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
                modal.style.display = "none";
            };

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target === modal) {
                  modal.style.display = "none";
                }
            };
        </script>
        
        <script>
            function myFunction2() {
                var x = document.getElementById("myNavbar");
                if (x.className === "navbar") {
                    x.className += " responsive";
                } else {
                    x.className = "navbar";
                }
            }
        </script>
        
        <script>
            var mainP = document.getElementById('mainProductos');
            var btnP = document.getElementById("myBtnProductos");
        </script>
            
        <script>
            var mainS = document.getElementById('mainServicios');
            var btnS = document.getElementById("myBtnServicios");
        </script>
        <script>
            var mainN = document.getElementById('mainNoticias');
            var btnN = document.getElementById("myBtnNoticias");        
        </script>

        <script>
            btnN.onclick = function(){actionMainNoticia();};
        </script>
        <script>
            btnS.onclick = function() {actionMainServicio();};
        </script>
         <script>
            btnP.onclick = function() {actionMainProducto();};
        </script>
        
    </body>
</html:html>
