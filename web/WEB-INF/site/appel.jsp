<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="sharedData.jsp"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Gestion groupe </title>
</head>

<%--J'ai remplace index par Gestion--%>
<body>



<article class="rightArticle">
    <div class="container">


        Veuillez choisir un groupe:	<form method="post" action="appel" id="groupe_tds">
        <select class="form-control" name="groupetds" id="groupetds" >
            <option></option>
            <c:if test="${not empty groupes}">
                <c:forEach  items="${groupes}" var="group" >
                    <option value="${group.idGroupe}">${group.nomGroupe}</option>
                </c:forEach>
            </c:if>
        </select>
    </form>


        Veuillez choisir une s�ance:	<form method="post" action="appel" id="seance">
        <select class="form-control" name="seances" id="seances">
            <option></option>
            <c:if test="${not empty seances}">
                <c:forEach  items="${seances}" var="seance" >
                    <option value="${seance.idSeance}">(${seance.idSeance})${seance.dateSeance}(${seance.dureeSeance})</option>
                </c:forEach>
            </c:if>
        </select>
    </form>
        <br><br>
        <h3><b>S�l�ctionn�: Groupe <a href="infosgroupe?idgroupe=${grselect}"  id="mine"></a>/ S�ance du<a href="" id="mo"> </a></b></h3>
        <form method="post" action="infosetudiant" name="etudiants_groupe" id="etudiants_groupe">
            <div class="form-group">
                <br><br>
                <table id="example"  class="table table-striped table-bordered" width="100%" cellspacing="0">

                    <thead>
                    <tr>
                        <th>Num_Etudiant</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Absence</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:if test="${not empty eleves}">
                        <c:forEach items="${eleves}"  var="eleve"  varStatus="status">
                            <tr>
                                <td><a href="infosetudiant?ideleve=${eleve.idEleve}"> ${eleve.idEleve}</a></td>
                                <td>${eleve.nomEleve}</td>
                                <td>${eleve.prenomEleve}</td>
                                <td><label class='switch'> <input class='switch-input' type='checkbox' id='check'/> <span class='switch-label'data-on='OUI' data-off='NON'></span>  <span class='switch-handle'></span>  </label>
                                </td>
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

    <c:if test="${empty seancesel}">
        <script>
            $(document).ready(function(){
                $("#etudiants_groupe").submit(function(event){
                    alert("veuillez choisir une s�ance svp!");
                    event.preventDefault();
                });

            });
        </script>
    </c:if>

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