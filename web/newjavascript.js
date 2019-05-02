/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var mainN = document.getElementById('mainNoticias');
var mainInformacion = document.getElementById("mainInformacion");
var btnN = document.getElementById("myBtnNoticias");
var mainS = document.getElementById('mainServicios');
var btnS = document.getElementById("myBtnServicios");
var mainP = document.getElementById('mainProductos');
var btnP = document.getElementById("myBtnProductos");
var mainU = document.getElementById('mainUsuarios');
var btnU = document.getElementById("myBtnUsuarios");
var subCP = document.getElementById('subCrearProducto');
var btnSCP = document.getElementById("myBtnCrearProducto");
var subBP = document.getElementById('subBuscarProducto');
var btnSBP = document.getElementById("myBtnBuscarProducto");
var subCS = document.getElementById('subCrearServicio');
var btnSCS = document.getElementById("myBtnCrearServicio");
var subBS = document.getElementById('subBuscarServicio');
var btnSBS = document.getElementById("myBtnBuscarServicio");
var subCU = document.getElementById('subCrearUsuario');
var btnSCU = document.getElementById("myBtnCrearUsuario");
var subBU = document.getElementById('subBuscarUsuario');
var btnSBU = document.getElementById("myBtnBuscarUsuario");
var subCN = document.getElementById('subCrearNoticia');
var btnSCN = document.getElementById("myBtnCrearNoticia");
var subBN = document.getElementById('subBuscarNoticia');
var btnSBN = document.getElementById("myBtnBuscarNoticia");
var mynavbarP = document.getElementById("myNavbarP");
var mynavbarN = document.getElementById("myNavbarN");
var mynavbarS = document.getElementById("myNavbarS");
var mynavbarU = document.getElementById("myNavbarU");

var subNpeticiones = document.getElementById('subNpeticiones');
var subPpeticiones = document.getElementById('subPpeticiones');
var subSpeticiones = document.getElementById('subSpeticiones');


function actionMainNoticia() {
    alert("Noti");
    mainN.style.display = "block";
    mainS.style.display = "none";
    mainP.style.display = "none";
    mainU.style.display = "none";
    mainInformacion.style.display="none";
};

function actionMainInformacion() {
     alert("info");
    mainInformacion.style.display = "block";
    mainN.style.display = "none";
    mainS.style.display = "none";
    mainP.style.display = "none";
    mainU.style.display = "none";
    
};

function actionMainServicio(){
     alert("Serv");
    mainS.style.display = "block";
    mainN.style.display = "none";
    mainP.style.display = "none";
    mainU.style.display = "none";
    mainInformacion.style.display = "none";
    
};

function actionMainUsuarios(){
     alert("Usus");
    mainU.style.display = "block";
    mainN.style.display = "none";
    mainS.style.display = "none";
    mainP.style.display = "none";
    mainInformacion.style.display = "none";

};

function actionMainProducto(){
     alert("Pro");
    mainP.style.display = "block";
    mainN.style.display = "none";
    mainS.style.display = "none";
    mainU.style.display = "none";
    mainInformacion.style.display = "none";
    
};

function actionCrearNoticia(){
    subCN.style.display = "block";
    subBN.style.display = "none";
    subNpeticiones.style.display="none";
};

function actionBuscarNoticia(){
    subBN.style.display = "block";
    subCN.style.display = "none";
    subNpeticiones.style.display="none";
};

function actionPeticionNoticia(){
    subNpeticiones.style.display="block";
    subCN.style.display = "none";
    subBN.style.display = "none";
};

function actionCrearProducto(){
    subCP.style.display = "block";
    subBP.style.display = "none";
    subPpeticiones.style.display="none";
};

function actionBuscarProducto(){
    subBP.style.display = "block";
    subCP.style.display = "none";
    subPpeticiones.style.display="none";
};

function actionPeticionProducto(){
    subPpeticiones.style.display="block";
    subBP.style.display = "none";
    subCP.style.display = "none";
};

function actionCrearServicio(){
    subCS.style.display = "block";
    subBS.style.display = "none";
    subSpeticiones.style.display = "none";
};

function actionBuscarServicio(){
    subBS.style.display = "block";
    subCS.style.display = "none";
    subSpeticiones.style.display = "none";
};

function actionPeticionServicio(){
    subSpeticiones.style.display = "block";
    subBS.style.display = "none";
    subCS.style.display = "none";
};


function actionCrearUsuario(){
    subCU.style.display = "block";
    subBU.style.display = "none";
};

function actionBuscarUsuario(){
    subBU.style.display = "block";
    subCU.style.display = "none";
};

function sortTableUser() {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTableU");
    switching = true;
    /*Make a loop that will continue until
     no switching has been done:*/
    while (switching) {
        //start by saying: no switching is done:
        switching = false;
        rows = table.rows;
        /*Loop through all table rows (except the
         first, which contains table headers):*/
        for (i = 1; i < (rows.length - 1); i++) {
            //start by saying there should be no switching:
            shouldSwitch = false;
            /*Get the two elements you want to compare,
             one from current row and one from the next:*/
            x = rows[i].getElementsByTagName("TD")[1];
            y = rows[i + 1].getElementsByTagName("TD")[1];
            //check if the two rows should switch place:
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                //if so, mark as a switch and break the loop:
                shouldSwitch = true;
                break;
            }
        }
        if (shouldSwitch) {
            /*If a switch has been marked, make the switch
             and mark that a switch has been done:*/
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
};


function sortTableProduct() {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTableP");
    switching = true;
    /*Make a loop that will continue until
     no switching has been done:*/
    while (switching) {
        //start by saying: no switching is done:
        switching = false;
        rows = table.rows;
        /*Loop through all table rows (except the
         first, which contains table headers):*/
        for (i = 1; i < (rows.length - 1); i++) {
            //start by saying there should be no switching:
            shouldSwitch = false;
            /*Get the two elements you want to compare,
             one from current row and one from the next:*/
            x = rows[i].getElementsByTagName("TD")[2];
            y = rows[i + 1].getElementsByTagName("TD")[2];
            //check if the two rows should switch place:
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                //if so, mark as a switch and break the loop:
                shouldSwitch = true;
                break;
            }
        }
        if (shouldSwitch) {
            /*If a switch has been marked, make the switch
             and mark that a switch has been done:*/
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
};


function sortTableNotice() {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTableN");
    switching = true;
    /*Make a loop that will continue until
     no switching has been done:*/
    while (switching) {
        //start by saying: no switching is done:
        switching = false;
        rows = table.rows;
        /*Loop through all table rows (except the
         first, which contains table headers):*/
        for (i = 1; i < (rows.length - 1); i++) {
            //start by saying there should be no switching:
            shouldSwitch = false;
            /*Get the two elements you want to compare,
             one from current row and one from the next:*/
            x = rows[i].getElementsByTagName("TD")[2];
            y = rows[i + 1].getElementsByTagName("TD")[2];
            //check if the two rows should switch place:
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                //if so, mark as a switch and break the loop:
                shouldSwitch = true;
                break;
            }
        }
        if (shouldSwitch) {
            /*If a switch has been marked, make the switch
             and mark that a switch has been done:*/
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
};


function sortTableService() {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTableS");
    switching = true;
    /*Make a loop that will continue until
     no switching has been done:*/
    while (switching) {
        //start by saying: no switching is done:
        switching = false;
        rows = table.rows;
        /*Loop through all table rows (except the
         first, which contains table headers):*/
        for (i = 1; i < (rows.length - 1); i++) {
            //start by saying there should be no switching:
            shouldSwitch = false;
            /*Get the two elements you want to compare,
             one from current row and one from the next:*/
            x = rows[i].getElementsByTagName("TD")[2];
            y = rows[i + 1].getElementsByTagName("TD")[2];
            //check if the two rows should switch place:
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                //if so, mark as a switch and break the loop:
                shouldSwitch = true;
                break;
            }
        }
        if (shouldSwitch) {
            /*If a switch has been marked, make the switch
             and mark that a switch has been done:*/
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
};


function buscarNoticia() {
    var input, filter, table, tr, td, i, txtValue;

    input = document.getElementById("myInputN");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTableN");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
};


function buscarProducto() {
    var input, filter, table, tr, td, i, txtValue;

    input = document.getElementById("myInputP");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTableP");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
};


function myFunctionBuscarServicio() {
    var input, filter, table, tr, td, i, txtValue;

    input = document.getElementById("myInputS");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTableS");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
};



function myFunctionBuscarUsuario() {
    var input, filter, table, tr, td, i, txtValue;

    input = document.getElementById("myInputU");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTableU");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
};