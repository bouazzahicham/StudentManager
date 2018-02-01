<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../sharedData.jsp"/>
<html>
<head>
	<title>Gestion des eleves  </title>
</head>

<%--J'ai remplace index par Gestion--%>
<body>
<article class="rightArticle gestionEleve" style="border-bottom: none" id="rightArticle">
	<div class="topnav">
		<a href="<c:url value="/gestionUtilisateur?Rechercher"/>">Rechercher</a>
		<a  href="<c:url value="/gestionUtilisateur?Rechercher"/>" >Ajouter</a>
	</div>

<div class="container" style="margin-left:-30px;width: 120%; ; display: block;">
    <br>
    <form method="post" action="infosetudiant" name="etudiants_groupe" id="etudiants_groupe">
        <div class="form-group">
            <br>
            <table id="example"  class="table table-striped table-bordered" width="102%" cellspacing="0">

                <thead>
                <tr>
                    <th>ID Utilisateur </th>
                    <th>mot de passe :</th>
                    <th>Nom:</th>
                    <th>Prenom</th>
                    <%--<th>Telephone</th>--%>
                    <%--<th>Naissance</th>--%>
                    <%--<th>Ville</th>--%>
                    <th>Description</th>
                    <th><em>ID Profil </em></th>
                    <th><i><h4>Extra :</h4></i> </th>
                </tr>
                </thead>

                <tbody>
                <c:if test="${not empty utilisateurs}">
                    <c:forEach items="${utilisateurs}"  var="utilisateur"  varStatus="status" >
                        <tr>
                            <td> ${utilisateur.idUtilisateur}</td>
                            <td>${utilisateur.motdePasse}</td>
                            <td>${utilisateur.nomProprietaire}</td>
                            <td>${utilisateur.prenomProprietaire}</td>
                            <%--<td>${utilisateur.telephoneUtilisateur}</td>--%>
                            <%--<td>${utilisateur.naissanceProprietaire}</td>--%>
                            <%--<td>${utilisateur.villeProprietaire}</td>--%>
                            <td>${utilisateur.descriptionUtilisateur}</td>
                            <td>${utilisateur.idProfil}</td>
                            <td><input type="button" style="width: 80px;%;height:20px;font-size:12px;" id="bouttonModifier" name="bouttonModifier" value="Modifier"></input></td>  </label>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>

        </div>

        <input type="hidden" id="ajouterUtilisateur" value="ajouterUtilisateur" />
    </form>
</div>




<script>
    $(document).ready(function(){
        $("#groupetds").change(function(){
            $("#groupe_tds").submit();
        });
    });
</script>

<script>
    $(document).ready(function(){
        $("#seances").change(function(){
            $("#seance").submit();
        });
    });
</script>



<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>

<c:if test="${not empty grselect}">
    <script>
        $("#groupetds option[value='${grselect}']")[0].selected = true;
        $("#mine").append($("#groupetds option[value='${grselect}'").text()) ;
    </script>
</c:if>


<c:if test="${not empty seancesel}">
    <script>
        $("#seances option[value='${seancesel}']")[0].selected = true;
        $("#mo").append($("#seances option[value='${seancesel}'").text()) ;
    </script>
</c:if>


</article>



</body>



</html>