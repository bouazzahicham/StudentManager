<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src=" https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src=" https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <title>Information sur l'étudiant : </title>
</head>

<body>
<jsp:include page="sharedData.jsp"/>
<article class="rightArticle">
    <div class="container">


        <p class="solid" style=" border:solid 1px black ;  margin-left:350px ;  padding: 20px ; width:300px; margin-bottom: -50px;">
            <label style="margin-right: 20px;"> ID de l'etudiant : </label> ${ideleve}<br>
            <label style="margin-right:20px;"> Nom : </label>   ${histo[0].nomEleve}<br>
            <label style="margin-right:20px ; "> Prenom :</label> : ${histo[0].prenomEleve}<br>
        </p>
        <div id="jQuery">
            <div id="Page1">

                <br><br>
                <label>Historique:
                    <div class="bunch">
                        <a href="#" onclick="return show('Page1','Page2','Page3');">    <button type=button class="btn btn-danger" > Historique&nbsp;&nbsp;&nbsp;  </button> </a>
                        <a href="#" onclick="return show('Page2','Page1','Page3');"> <button type=button class="btn btn-primary">Absence&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        </button></a>
                        <a href="#" onclick="return show('Page3','Page2','Page1');">   <button type=button class="btn btn-warning"> Evaluations
                        </button></a>
                    </div></label>
                <table id="historique_view"  name="historique_view" class="table table-striped table-bordered" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Libelle</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty histo}">
                        <c:forEach items="${histo}"  var="histo"  varStatus="status">
                            <tr>
                                <td>${histo.dateEvent}  ${histo.dureeEvent}</td>
                                <td> ${histo.descriptionEvent} </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <div id="Page2" style="display:none">

                <br><br>
                <label>Absences:        <div class="bunch">
                    <a href="#" onclick="return show('Page1','Page2','Page3');">    <button type=button class="btn btn-danger" > Historique&nbsp;&nbsp;&nbsp;  </button> </a>
                    <a href="#" onclick="return show('Page2','Page1','Page3');"> <button type=button class="btn btn-primary">Absence&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </button></a>
                    <a href="#" onclick="return show('Page3','Page2','Page1');">   <button type=button class="btn btn-warning"> Evaluations
                    </button></a>
                </div>
                </label>
                <table id="absence_view"  name="absence_view" class="table table-striped table-bordered" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Groupe</th>
                        <th>Justifi�e</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty absences}">
                        <c:forEach items="${absences}"  var="absence"  varStatus="status">
                            <tr>
                                <td>${absence.dateAbsence}</td>
                                <td>${histo[0].nomGroupe}</td>
                                <c:if test="${absence.justifie==0}"><td> Justifi�e</td></c:if>
                                <c:if test="${absence.justifie==1}"><td> Non Justifi�e</td></c:if>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>

            </div>

            <div id="Page3" style="display: none">

                <br><br>
                <label>Evaluations :        <div class="bunch">
                    <a href="#" onclick="return show('Page1','Page2','Page3');">    <button type=button class="btn btn-danger" > Historique&nbsp;&nbsp;&nbsp;  </button> </a>
                    <a href="#" onclick="return show('Page2','Page1','Page3');"> <button type=button class="btn btn-primary">Absence&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </button></a>
                    <a href="#" onclick="return show('Page3','Page2','Page1');">   <button type=button class="btn btn-warning"> Evaluations
                    </button></a>
                </div></label>
                <table id="resultat_view"  name="resultat_view" class="table table-striped table-bordered" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>UE</th>
                        <th>Domaine</th>
                        <th>Date Epreuve</th>
                        <th>Note</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty evaluations}">
                        <c:forEach items="${evaluations}"  var="evaluation"  varStatus="status">
                            <tr>
                                <td></td>
                                <td>${evaluation.domaine}</td>
                                <td>${evaluation.dateEvaluation}</td>
                                <td>${evaluation.noteEleve}/${evaluation.pointsMaxEvaluation}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>




    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#resultat_view').DataTable();
            $('#historique_view').DataTable();
            $('#absence_view').DataTable();
        });
    </script>
</article>
<script>
    function show(shown, hidden,hidden2) {
        document.getElementById(shown).style.display='block';
        document.getElementById(hidden).style.display='none';
        document.getElementById(hidden2).style.display='none';
        return false;
    }
</script>
</body>
</html>

<style>
    h2{
        margin-left: 45%;
        margin-top: 5%;
        color:#808080;
    }
    #jQuery
    {
        display: inline-block;
        width: 90%;
        margin-left: 20px;
    }

    .bunch
    {
        margin-top: 50px;
        margin-left: 0px ;
        display: inline-block;
        /*text-align: center;*/
        padding: 10px;
        /*margin-left: 30%;*/
        /*margin-top: 5%;*/
    }

    #user{
        /*margin-top: 3%;*/
        font-size:20px;
        color: #808080;
    }
</style>