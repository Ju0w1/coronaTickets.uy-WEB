<%-- 
    Document   : Header
    Created on : Oct 1, 2021, 4:50:29 PM
    Author     : FederRodríguez
--%>
<link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
<%@page import="Logica.Interfaz.IControladorEspectaculo"%>
<%@page import="Logica.Interfaz.IControladorPaquete"%>
<%@page import="Logica.Fabrica"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<!DOCTYPE html>
<%
    Fabrica fabrica = Fabrica.getInstance();
    IControladorPaquete ICP = fabrica.getIControladorPaquete();
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    Map<String, Paquete> paquetes = (Map<String, Paquete>) ICP.getPaquetesV2();
    Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) ICE.getEspectaculos();
    int i = 0;
    String[] concat = new String[paquetes.size() + espectaculos.size()];
    int paqSize = paquetes.size();
    int espSize = espectaculos.size();

%>
<style>

    .autocomplete-items {
        position: absolute;
        border: 1px solid #d4d4d4;
        border-bottom: none;
        border-top: none;
        z-index: 99;
        /*position the autocomplete items to be the same width as the container:*/
        top: 100%;
        left: 0;
        right: 0;
    }

    .autocomplete-items div {
        padding: 10px;
        cursor: pointer;
        background-color: #fff; 
        border-bottom: 1px solid #d4d4d4; 
    }

    /*when hovering an item:*/
    .autocomplete-items div:hover {
        background-color: #e9e9e9; 
    }

    /*when navigating through the items using the arrow keys:*/
    .autocomplete-active {
        background-color: DodgerBlue !important; 
        color: #ffffff; 
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="/CoronaTickets-Web/home" style="margin-right: 40px;margin-right: 40px;">
            <img src="https://i.imgur.com/9HUpz3c.png" alt="" width="100" height="40">
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item" style="margin-right: 40px;">

                    <div class="input-group" style="width: 400px;">
                        <form autocomplete="off" name="ver_mas" method="POST" action="/CoronaTickets-Web/Paquete" id="buscarform" style="display: flex; flex-direction: row;">
                            <div class="autocomplete" style="width:300px;">
                                <input type="hidden" value="" name="ver_mas" id="selectedItem" style="display: block;">
                                <input class="form-control border-end-0 border rounded-pill" id="myInput" type="text" name="myCountry" placeholder="Paquetes, Espectáculos" style="display: block;">
                            </div>
                            <span class="input-group-append">
                                    <button class="btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill" style="margin-left: -40px; height: 37px" type="submit">
                                        <i class="bi bi-search"></i>
                                    </button>
                            </span>
                        </form>
                    </div>
                   
                </li>
                <!--<li class="nav-item dropdown" style="margin-right: 40px;">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <strong>Plataformas</strong>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown" style="margin-right: 40px;">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <strong>Categorías</strong>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>-->
            </ul>
        </div>
        <form method="get" action="/CoronaTickets-Web/Pages/Login/login.jsp"> 
            <button type="submit" class="btn btn-outline-dark"><strong>Ingresar</strong> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16" >
                <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
                <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                </svg></button>
        </form>
    </div>
</nav>

<script>
    var itemSeleccionado;
    function autocomplete(inp, arr) {
        /*the autocomplete function takes two arguments,
         the text field element and an array of possible autocompleted values:*/
        var currentFocus;
        /*execute a function when someone writes in the text field:*/
        inp.addEventListener("input", function (e) {
            var a, b, i, val = this.value;
            /*close any already open lists of autocompleted values*/
            closeAllLists();
            if (!val) {
                return false;
            }
            currentFocus = -1;
            /*create a DIV element that will contain the items (values):*/
            a = document.createElement("DIV");
            a.setAttribute("id", this.id + "autocomplete-list");
            a.setAttribute("class", "autocomplete-items");
            /*append the DIV element as a child of the autocomplete container:*/
            this.parentNode.appendChild(a);
            /*for each item in the array...*/
            for (i = 0; i < arr.length; i++) {
                /*check if the item starts with the same letters as the text field value:*/
                if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                    /*create a DIV element for each matching element:*/
                    b = document.createElement("DIV");
                    /*make the matching letters bold:*/
                    b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                    b.innerHTML += arr[i].substr(val.length);
                    /*insert a input field that will hold the current array item's value:*/
                    b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                    /*execute a function when someone clicks on the item value (DIV element):*/
                    b.addEventListener("click", function (e) {
                        /*insert the value for the autocomplete text field:*/
                        inp.value = this.getElementsByTagName("input")[0].value;
                        itemSeleccionado = inp.value;
                        testing();
                        /*close the list of autocompleted values,
                         (or any other open lists of autocompleted values:*/
                        closeAllLists();
                    });
                    a.appendChild(b);
                }
            }
        });
        /*execute a function presses a key on the keyboard:*/
        inp.addEventListener("keydown", function (e) {
            var x = document.getElementById(this.id + "autocomplete-list");
            if (x)
                x = x.getElementsByTagName("div");
            if (e.keyCode == 40) {
                /*If the arrow DOWN key is pressed,
                 increase the currentFocus variable:*/
                currentFocus++;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 38) { //up
                /*If the arrow UP key is pressed,
                 decrease the currentFocus variable:*/
                currentFocus--;
                /*and and make the current item more visible:*/
                addActive(x);
            } else if (e.keyCode == 13) {
                /*If the ENTER key is pressed, prevent the form from being submitted,*/
                e.preventDefault();
                if (currentFocus > -1) {
                    /*and simulate a click on the "active" item:*/
                    if (x)
                        x[currentFocus].click();
                }
            }
        });
        function addActive(x) {
            /*a function to classify an item as "active":*/
            if (!x)
                return false;
            /*start by removing the "active" class on all items:*/
            removeActive(x);
            if (currentFocus >= x.length)
                currentFocus = 0;
            if (currentFocus < 0)
                currentFocus = (x.length - 1);
            /*add class "autocomplete-active":*/
            x[currentFocus].classList.add("autocomplete-active");
        }
        function removeActive(x) {
            /*a function to remove the "active" class from all autocomplete items:*/
            for (var i = 0; i < x.length; i++) {
                x[i].classList.remove("autocomplete-active");
            }
        }
        function closeAllLists(elmnt) {
            /*close all autocomplete lists in the document,
             except the one passed as an argument:*/
            var x = document.getElementsByClassName("autocomplete-items");
            for (var i = 0; i < x.length; i++) {
                if (elmnt != x[i] && elmnt != inp) {
                    x[i].parentNode.removeChild(x[i]);
                }
            }
        }
        /*execute a function when someone clicks in the document:*/
        document.addEventListener("click", function (e) {
            closeAllLists(e.target);

        });
    }



    /*An array containing all the country names in the world:*/
    var searchseleccionado =
    <%        for (Map.Entry<String, Paquete> entry : paquetes.entrySet()) {
            String key = entry.getKey();
            Paquete value = entry.getValue();
            String nombre = value.getNombre();
            String nombrep = value.getNombre();
            String desc = value.getDescripcion();

            String mes1;
            if (value.getFecha_Inicio().getMes() < 10) {
                mes1 = "0" + value.getFecha_Inicio().getMes();
            } else {
                mes1 = Integer.toString(value.getFecha_Inicio().getMes());
            }
            String dia1;
            if (value.getFecha_Inicio().getDia() < 10) {
                dia1 = "0" + value.getFecha_Inicio().getDia();
            } else {
                dia1 = Integer.toString(value.getFecha_Inicio().getDia());
            }
            String mes2;
            if (value.getFecha_Fin().getMes() < 10) {
                mes2 = "0" + value.getFecha_Fin().getMes();
            } else {
                mes2 = Integer.toString(value.getFecha_Fin().getMes());
            }
            String dia2;
            if (value.getFecha_Fin().getDia() < 10) {
                dia2 = "0" + value.getFecha_Fin().getDia();
            } else {
                dia2 = Integer.toString(value.getFecha_Inicio().getDia());
            }

            String fechaIni = value.getFecha_Inicio().getAnio() + "-" + mes1 + "-" + dia1;
            String fechaFin = value.getFecha_Fin().getAnio() + "-" + mes2 + "-" + dia2;
            //String fechaFin = value.getFecha_Fin().getDia()+"/"+value.getFecha_Fin().getMes()+"/"+value.getFecha_Fin().getAnio();

            float descuento = value.getDescuento();
            float costop = value.getCosto();
            String urlImagenp = value.getUrl();
            concat[i] = nombrep + "@" + desc + "@" + fechaIni + "@" + fechaFin + "@" + Float.toString(descuento) + "@" + Float.toString(costop) + "@" + urlImagenp;
            if (i == 0) {
    %>
    ["<%=nombre%>",<%%>
    <%
        i++;
    } else {
    %>
    "<%=nombre%>",
    <%
                i++;
            }
        }
    %>
    <%
        for (Map.Entry<String, Espectaculo> entry : espectaculos.entrySet()) {
            String key = entry.getKey();
            Espectaculo value = entry.getValue();
            String nombre = value.getNombre();
            String artista = Integer.toString(value.getArtista());
            String descripcion = value.getDescripcion();
            String especmax = Integer.toString(value.getMax());
            String especmin = Integer.toString(value.getMin());
            String url = value.getUrl();
            String costo = Double.toString(value.getCosto());
            String duracion = Double.toString(value.getDuracion());
            String fecha = value.getFecha().toString();
            String urlImagen = value.getUrlIamgen();
            concat[i] = nombre + "@" + artista + "@" + descripcion + "@" + especmax + "@" + especmin + "@" + url + "@" + costo + "@" + duracion + "@" + fecha + "@" + urlImagen;
    %>
    "<%=nombre%>",
    <%
            i++;
        }
    %>
    ];

    //["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Anguilla", "Antigua & Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia & Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central Arfrican Republic", "Chad", "Chile", "China", "Colombia", "Congo", "Cook Islands", "Costa Rica", "Cote D Ivoire", "Croatia", "Cuba", "Curacao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Polynesia", "French West Indies", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea Bissau", "Guyana", "Haiti", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauro", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Korea", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint Pierre & Miquelon", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka", "St Kitts & Nevis", "St Lucia", "St Vincent", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor L'Este", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks & Caicos", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Virgin Islands (US)", "Yemen", "Zambia", "Zimbabwe"];
    /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/

    <%int h = 0;%>
    var valorconcat =
    <%for (h = 0; h < concat.length; h++) {%>
    <%if (h == 0) {%>
    ["<%=concat[h]%>",
    <%} else {%>
    "<%=concat[h]%>",
    <%
        }%>
    <%}%>
    ];
    let indexSeleccionado;
    var isPaquete = false;
    function testing() {
        for (let y = 0; y < <%=paqSize%>; y++) {
            var arrayDeCadenas = valorconcat[y].split("@");
            console.log("Array" + arrayDeCadenas[0]);
            console.log("Selected:" + itemSeleccionado);
            if (itemSeleccionado == arrayDeCadenas[0]) {
                indexSeleccionado = y;
                isPaquete = true;
            }
        }

        for (let y = 0; y <<%=paqSize + espSize%>; y++) {
            var arrayDeCadenas = valorconcat[y].split("@");
            console.log("Array" + arrayDeCadenas[0]);
            console.log("Selected:" + itemSeleccionado);
            if (itemSeleccionado == arrayDeCadenas[0]) {
                indexSeleccionado = y;
            }
        }
        if (isPaquete == true) {
            document.getElementById("selectedItem").value = valorconcat[indexSeleccionado]; //Único detalle a ver es el obtener el índice que seleccionó
            console.log(valorconcat[indexSeleccionado]);
        } else {
            document.getElementById("buscarform").action = "/CoronaTickets-Web/Espectaculo";
            document.getElementById("selectedItem").value = valorconcat[indexSeleccionado]; //Único detalle a ver es el obtener el índice que seleccionó
            console.log(valorconcat[indexSeleccionado]);
        }

    }

    document.getElementById("selectedItem").value = valorconcat[indexSeleccionado]; //Único detalle a ver es el obtener el índice que seleccionó
    autocomplete(document.getElementById("myInput"), searchseleccionado);

</script>

