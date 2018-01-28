<jsp:include page="accueil.jsp"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Insert title here</title>
</head>
<body>


<article class="rightArticle">
<label> Informations:</label>
<p class="solid"style=" border-style:solid; width:250px;">
	 <label> Nom:</label>${seances[0].nomGroupe}<br>
	 <label> Proffesseur:</label>${seances[0].nomProprietaire}<br>
	 <label> UE:</label><br>
	 <label> Semestre-Ann�e:</label><br>
	 <label> Cr�neau:</label>${seances[0].creneauGroupe}<br>
</p>

<label>Eleves du groupe:</label>
<table id="students_view"  name="students_view" class="table table-striped table-bordered" width="100%" cellspacing="0">
		    <thead>
		      <tr>
		      	<th>Num_Etudiant</th>
				<th>Nom</th>
				<th>Prenom</th>
		      </tr>
		    </thead>
		    <tbody>
			<c:if test="${not empty eleves}">
				<c:forEach items="${eleves}"  var="etudiant"  varStatus="status">
						<tr>
							<td>${etudiant.idEleve}</td>
							<td>${etudiant.nomEleve}</td>
							<td>${etudiant.prenomEleve}</td>
						</tr>
				</c:forEach>
			</c:if>
		    </tbody>
</table>


<label>S�ances du groupe:</label>
<table id="seance_view"  name="seance_view" class="table table-striped table-bordered" width="100%" cellspacing="0">
		    <thead>
		      <tr>
		      	<th>Date</th>
				<th>Appel</th>
		      </tr>
		    </thead>
		    <tbody>
			<c:if test="${not empty seances}">
				<c:forEach items="${seances}"  var="seance"  varStatus="status">
						<tr>
							<td>${seance.dateSeance}</td>
							<td>${seance.app}</td>
						</tr>
				</c:forEach>
			</c:if>
		    </tbody>
</table>


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
							<td>${histo.dateEvent}</td>
							<td>${histo.nomEleve} a ${histo.descriptionEvent} </td>
						</tr>
				</c:forEach>
			</c:if>
		    </tbody>
</table>


<script type="text/javascript">
	$(document).ready(function() {
	    $('#students_view').DataTable();
	    $('#historique_view').DataTable();
	    $('#seance_view').DataTable();
		});
 </script>



</article>
</body>
</html>