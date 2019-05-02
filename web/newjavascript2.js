/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var mainN = document.getElementById('mainNoticias');
var btnN = document.getElementById("myBtnNoticias");
var mainS = document.getElementById('mainServicios');
var btnS = document.getElementById("myBtnServicios");
var mainP = document.getElementById('mainProductos');
var btnP = document.getElementById("myBtnProductos");

function actionMainNoticia() {
    mainN.style.display = "block";
    mainS.style.display = "none";
    mainP.style.display = "none";
};

function actionMainServicio(){
    mainS.style.display = "block";
    mainN.style.display = "none";
    mainP.style.display = "none";
    
};

function actionMainProducto(){
    mainP.style.display = "block";
    mainN.style.display = "none";
    mainS.style.display = "none";    
};