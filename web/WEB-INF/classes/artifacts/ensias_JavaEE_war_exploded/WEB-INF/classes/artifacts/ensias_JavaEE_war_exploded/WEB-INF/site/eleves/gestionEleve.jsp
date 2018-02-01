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
		<a href="<c:url value="/gestionEleve?Rechercher"/>">Rechercher</a>
		<a  href="<c:url value="/gestionEleve?Ajouter"/>" >Ajouter</a>
	</div>

<div class="container" style="margin-left:-30px;width: 120%; ; display: block;">
    <br>
    <form method="post" action="infosetudiant" name="etudiants_groupe" id="etudiants_groupe">
        <div class="form-group">
            <br>
            <table id="example"  class="table table-striped table-bordered" width="102%" cellspacing="0">

                <thead>
                <tr>
                    <th>ID Eleve </th>
                    <th>Nom : </th>
                    <th>Prenom</th>
                    <th>Telephone</th>
                    <th><strong>ID Groupe </strong></th>
                    <th><i><h4>Extra :</h4></i> </th>
                </tr>
                </thead>

                <tbody>
                <c:if test="${not empty eleves}">
                    <c:forEach items="${eleves}"  var="eleve"  varStatus="status" >
                        <tr>
                            <td> ${eleve.idEleve}</td>
                            <td>${eleve.nomEleve}</td>
                            <td>${eleve.prenomEleve}</td>
                            <td>${eleve.telephoneEleve}</td>
                            <td><strong>${eleve.idGroupe}</strong></td>
                            <td><input type="button" style="width: 80px;%;height:20px;font-size:12px;" id="bouttonModifier" name="bouttonModifier" value="Modifier"></input></td>  </label>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>

            <input type="submit" class="btn btn-primary" value="Submit Button">
        </div>
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