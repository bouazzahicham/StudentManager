<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<jsp:include page="accueil.jsp"/>
<article class="rightArticle">
    <div class="container">

        <label> Informations:</label>
        <p class="solid"style=" border-style:solid; width:250px;">
            <label> N� �tudiant:</label>${ideleve}<br>
            <label> Nom:</label>${histo[0].nomEleve}<br>
            <label> Pr�nom:</label>${histo[0].prenomEleve}<br>
        </p>


        <label>Historique :</label>
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




        <label>Absences:</label>
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




        <label>Absences:</label>
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



<script type="text/javascript">
    $(document).ready(function() {
        $('#resultat_view').DataTable();
        $('#historique_view').DataTable();
        $('#absence_view').DataTable();
    });
</script>
</article>

</body>
</html>
