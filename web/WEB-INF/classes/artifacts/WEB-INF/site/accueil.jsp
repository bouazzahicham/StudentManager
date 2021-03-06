<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <title>Page d'accueil </title>
    <meta charset="utf-8" />
    <link href="<c:url value="/inc/css/designAccueil.css"/>" type="text/css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="<c:url value="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"/>" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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

                <li>
                    <a href="/evaluation">
                        <i class="fa fa-user fa-lg"></i> Gestion d'evaluation
                    </a>
                </li>
                <li  data-toggle="collapse" data-target="#products" class="collapsed active">
                    <a href=""><i class="fa fa-gift fa-lg"></i>  <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="products">
                    <li class="active"> <li><a href="#">Gérer</a></li>
                    <li><a href="#">Requete à l'administration </a></li>

                </ul>


                <li data-toggle="collapse" data-target="#service" class="collapsed">
                    <a href="#"><i class="fa fa-globe fa-lg"></i> Services <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="service">
                    <li>New Service 1</li>
                    <li>New Service 2</li>
                    <li>New Service 3</li>
                </ul>


                <li data-toggle="collapse" data-target="#new" class="collapsed">
                    <a href="#"><i class="fa fa-car fa-lg"></i> New <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="new">
                    <li>New New 1</li>
                    <li>New New 2</li>
                    <li>New New 3</li>
                </ul>



                <li>
                    <a href="#">
                        <i class="fa fa-users fa-lg"></i> Users
                    </a>
                </li>

                <li>
                <a href="#">
                    <i class="fa fa-users fa-lg"></i> Se deconnecter
                </a>
                </li>


            </ul>
        </div>
    </div>
</nav>


<article class="rightArticle">

</article>




</body>



<footer>



</footer>



</html>
