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
        <a href="<c:url value="/gestionGroupe?Rechercher"/>">Rechercher</a>
        <a  href="<c:url value="/gestionGroupe?Ajouter"/>" >Ajouter</a>
    </div>

    <div class="container" style="margin-left:-30px;width: 120%; ; display: block;">
        <br>
        <form method="post" action="infosetudiant" name="etudiants_groupe" id="etudiants_groupe">
            <div class="form-group">
                <br>
                <table id="example"  class="table table-striped table-bordered" width="102%" cellspacing="0">

                    <thead>
                    <tr>
                        <th>ID groupe : </th>
                        <th>Nom : </th>
                        <th>Description groupe : </th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:if test="${not empty groupeListe}">
                        <c:forEach items="${groupeListe}"  var="groupe"  varStatus="status" >
                            <tr>
                                <td> ${groupe.idGroupe}</td>
                                <td>${groupe.nomGroupe}</td>
                                <td>${groupe.descriptionGroupe}</td>
                                <%--<td><input type="button" style="width: 80px;%;height:20px;font-size:12px;" id="bouttonModifier" name="bouttonModifier" value="Modifier"></input></td>  </label>--%>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
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