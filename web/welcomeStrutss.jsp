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
        <html:base/>
        
        <style> 
            
            body {
                margin: 0;
                font-size: 28px;
                font-family: Arial, Helvetica, sans-serif;
            }

            #header {
                background-color: #f1f1f1;
                padding: 30px;
                text-align: center;
            }

            #navbar {
                overflow: hidden;
                background-color: #333;
            }

            #navbar a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            #navbar a.active {
                background-color: #23527c;
                color: white;
            }
            
            #navbar a:hover {
                background-color: #ddd;
                color: black;
            }

            .content {
                padding: 0px;
            }

            .sticky {
                position: fixed;
                top: 0;
                width: 100%;
            }

            .sticky + .content {
                padding-top: 60px;
            }
           
            
            .navbar .icon {
                display: none;
            }
            
            .dropdown {
                float: left;
                overflow: hidden;
            }

            .dropdown .dropbtn {
                font-size: 17px;    
                border: none;
                outline: none;
                color: white;
                padding: 14px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                float: none;
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }

            .dropdown:hover .dropbtn {
                background-color: #555;
                color: white;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
                color: black;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
           
            @media screen and (max-width: 600px) {
                 .navbar a:not(:first-child) {
                    float: none;
                    display: block;
                    width: 100%;
                    text-align: center;
                }
                .navbar a.icon {
                    float: right;
                    display: block;
                }
                .dropdown .dropbtn {
                    display: none;
                }
            }

            @media screen and (max-width: 600px) {
                .navbar.responsive {
                    position: relative;
                }
                .navbar.responsive .icon {
                    position: absolute;
                    right: 0;
                    top: 0;
                }
                .navbar.responsive a {
                    float: none;
                    display: block;
                    text-align: left;
                }
                .navbar.responsive .dropdown {
                     float: none;
                }
                .navbar.responsive .dropdown-content {
                    position: relative;
                }
                .navbar.responsive .dropdown .dropbtn {
                    display: block;
                    width: 100%;
                    text-align: center;
                }
            }
            
            /* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
            
            /* Modal Content */
            .modal-content {
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 1px solid #888;
                width: 50%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s
            }

            /* Add Animation */
            @-webkit-keyframes animatetop {
                from {top:-300px; opacity:0} 
                to {top:0; opacity:1}
            }

            @keyframes animatetop {
                from {top:-300px; opacity:0}
                to {top:0; opacity:1}
            }

            /* The Close Button */
            .close {
                color: white;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover, .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            
            .modal {
                display: none; 
                position: fixed; 
                z-index: 1;
                padding-top: 80px; 
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            .modal-header {
                padding: 2px 16px;
                background-color: #5cb85c;
                color: white;
            }

            .modal-body {
                padding: 8px 16px;
                text-align: center;

            }

            .modal-footer {
                padding: 2px 16px;
                background-color: #5cb85c;
                color: white;
            }
            
             article{
                background: #666;
                float: right;
                padding: 0px;
                width: 100%;
                height: 900px; /* only for demonstration, should be removed */
            }
           @media (max-width: 500px) {
                 article {
                    width: 100%;
                    height: auto;
                }
            }
            
        </style>
        
    </head>
    
    <body style="background-color: white">
        
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>dropdown
        </logic:notPresent>
        
        <div id="myModal" class="modal"> 
            <form class="modal-content animate" action="./principal.do?method=login" method="post">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                    <img src="img_avatar2.png" alt="Avatar" class="avatar">
                </div>

                <div class="container">
                    <label for="uname"><b>Username</b></label>
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
        
        <div id="navbar" >
            <a class="active" href="#home" class="fa fa-fw fa-home"> Noticias</a>
            <div class="dropdown">
                <button class="dropbtn"> <i class="fa fa-fw fa-buysellads"></i> Productos</button>
                <div class="dropdown-content">
                  <a href="#">COMPRA</a>
                  <a href="#">VENTA</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn"> <i class="fa fa-fw fa-building"></i> Servicios</button>
                <div class="dropdown-content">
                  <a href="#">COMPRA</a>
                  <a href="#">VENTA</a>
                </div>
            </div> 
             <a href="#about"> <i class="fa fa-fw fa-user"></i>Integrantes</a>
            <div class="dropdown">
                <button class="dropbtn" > <i class="fa fa-fw fa-user"></i> Iniciar Sesion</button>
                <div class="dropdown-content">
                  <a id="myBtn">INICIAR SESIÓN</a>
                  <a href="./registrar_cuenta.do">REGISTRARSE</a>
                </div>
            </div> 
           
            <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction2()">&#9776;</a>
        </div> 
                
        <form action="" method="post">
            
        </form>
        
        <div class="content" >
            <article>
                <h1>NOTICIA</h1>
                <p>London is the capital city of England. It is the most populous city in the  United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
                <p>Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium.</p>
            </article>
        </div>
               
        <script>
            window.onscroll = function() {myFunction();};

            var navbar = document.getElementById("navbar");
            var sticky = navbar.offsetTop;

            function myFunction() {
                if (window.pageYOffset >= sticky) {
                  navbar.classList.add("sticky");
                } else {
                  navbar.classList.remove("sticky");
                }
            }
        </script>
        
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
    </body>
      
    </body>
</html:html>
