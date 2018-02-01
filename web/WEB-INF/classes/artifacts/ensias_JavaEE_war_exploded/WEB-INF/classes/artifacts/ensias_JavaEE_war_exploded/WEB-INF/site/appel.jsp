<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="sharedData.jsp"/>
<html>
<head>
	<title>Gestion groupe </title>
</head>

<%--J'ai remplace index par Gestion--%>
<body>



<article class="rightArticle" style="text-align: left; ">
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


        Veuillez choisir une seance :	<form method="post" action="appel" id="seance">
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
        <h3><b>Selectionner : Groupe <a href="infosgroupe?idgroupe=${grselect}"  id="mine"></a>/ Seance  du<a href="" id="mo"> </a></b></h3>
        <form method="post" action="/students" name="etudiants_groupe" id="etudiants_groupe">
            <div class="form-group">
                <br><br>
                <input name="seasel" id="seasel" type="hidden" value=""></input>
                <input name="myids" id="myids" type="hidden" value=""></input>
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
                                <td><a href="infosetudiant?ideleve=${eleve.idEleve}"><id>${eleve.idEleve}</id></a></td>
                                <td>${eleve.nomEleve}</td>
                                <td>${eleve.prenomEleve}</td>
                                <td><label class='switch'> <input class='switch-input' type='checkbox' id='check'/> <span class='switch-label'data-on='OUI' data-off='NON'></span>  <span class='switch-handle'></span>  </label>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-primary" value="Submit Button" onclick="mok()">
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
                    alert("veuillez choisir une seance : ");
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

    <script>
        function mok()
        {
            var table = document.getElementById("example");
            checkbox = table.getElementsByTagName("input");
            id=table.getElementsByTagName("id");
            var myids="";
            for(var indexCheckbox = 0; indexCheckbox<checkbox.length; indexCheckbox++)
            {
                if(checkbox[indexCheckbox].checked)
                {
                    myids=myids+id[indexCheckbox].innerHTML+',';
                }
            }
            document.getElementById("myids").setAttribute("value",myids);
            document.getElementById("seasel").setAttribute("value","${seancesel}");
        }
    </script>


</article>
</body>
</html>