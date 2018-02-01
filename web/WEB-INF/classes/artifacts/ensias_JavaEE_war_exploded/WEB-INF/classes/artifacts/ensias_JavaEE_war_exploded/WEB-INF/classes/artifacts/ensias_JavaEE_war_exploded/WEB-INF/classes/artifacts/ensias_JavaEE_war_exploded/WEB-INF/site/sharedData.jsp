<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <%--A nettoyer --%>
    <meta charset="utf-8" />
    <script src="<c:url value="/inc/js/scripts.js" />"  type="text/javascript"></script>
    <link href="<c:url value="/inc/css/designAccueil.css"/>" type="text/css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="<c:url value="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"/>" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src=" https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src=" https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
</head>

<body>


<nav id="navigation">
<div class="nav-side-menu">
<div class="brand">Student Manager </div>
<div class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></div>
<div class="menu-list">
<ul id="menu-content" class="menu-content collapse out">
<li>
    <a href="/accueil">
        <i class="fa fa-dashboard fa-lg"></i> Accueil
    </a>
</li>
<li>
    <a href="/appel">
        <i class="fa fa-user fa-lg"></i> Faire l'appel
    </a>
</li>



<li  data-toggle="collapse" data-target="#products" class="collapsed">
    <a><i class="fa fa-globe fa-lg"></i>Gestion d'evaluation <span class="arrow"></span></a>
</li>
<ul class="sub-menu collapse" id="products">
    <li><a href="/infosevaluation">Gérer</a></li>
    <%--<li><a href="/evaluation">Requete à l'administration </a></li>--%>
</ul>


<%--<li data-toggle="collapse" data-target="#service" class="collapsed">--%>
<%--<a href="#"><i class="fa fa-globe fa-lg"></i> Gestion d'evaluation <span class="arrow"></span></a>--%>
<%--</li>--%>
<%--<ul class="sub-menu collapse" id="service">--%>
<%--<li>Gérer</li>--%>
<%--<li>Requetes </li>--%>
<%--</ul>--%>

<c:if test="${sessionScope.utilisateur.idProfil == 0}">
        <%--Conditionner avec le <c:if --%>
        <li data-toggle="collapse" data-target="#new" class="collapsed">
            <a><i class="fa fa-car fa-lg"></i> ~Panneau d'administration  <span class="arrow"></span></a>
        </li>
        <ul class="sub-menu collapse" id="new">
            <li><a href="/gestionEleve?Ajouter"> #Gerer les eleves </a></li>
            <li><a href="/gestionGroupe?Ajouter">#Gerer les groupes </a></li>
            <li>#Gerer les seances</li>
            <li><a href="/gestionUtilisateur?Rechercher">#Gerer les utilisateurs </a></li>

        </ul>


        <li>
            <a href="#">
                <i class="fa fa-users fa-lg"></i> Users
            </a>
        </li>
</c:if>

    <li>
    <a href="/deconnexion">
    <i class="fa fa-users fa-lg"></i> Se deconnecter
    </a>
    </li>


    </ul>
    </div>
    </div>
    </nav>




    </body>



    <footer>



    </footer>



    </html>
