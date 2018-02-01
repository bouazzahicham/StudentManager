
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="sharedData.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src=" https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src=" https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">

	<style>
		.switch {
			position: relative;
			display: block;
			vertical-align: top;
			width: 100px;
			height: 30px;
			padding: 3px;
			margin: 0 10px 10px 0;
			background: linear-gradient(to bottom, #eeeeee, #FFFFFF 25px);
			background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF 25px);
			border-radius: 18px;
			box-shadow: inset 0 -1px white, inset 0 1px 1px rgba(0, 0, 0, 0.05);
			cursor: pointer;
			box-sizing:content-box;
		}
		.switch-input {
			position: absolute;
			top: 0;
			left: 0;
			opacity: 0;
			box-sizing:content-box;
		}
		.switch-label {
			position: relative;
			display: block;
			height: inherit;
			font-size: 10px;
			text-transform: uppercase;
			background: #eceeef;
			border-radius: inherit;
			box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.15);
			box-sizing:content-box;
		}
		.switch-label:before, .switch-label:after {
			position: absolute;
			top: 50%;
			margin-top: -.5em;
			line-height: 1;
			-webkit-transition: inherit;
			-moz-transition: inherit;
			-o-transition: inherit;
			transition: inherit;
			box-sizing:content-box;
		}
		.switch-label:before {
			content: attr(data-off);
			right: 11px;
			color: #aaaaaa;
			text-shadow: 0 1px rgba(255, 255, 255, 0.5);
		}
		.switch-label:after {
			content: attr(data-on);
			left: 11px;
			color: #FFFFFF;
			text-shadow: 0 1px rgba(0, 0, 0, 0.2);
			opacity: 0;
		}
		.switch-input:checked ~ .switch-label {
			background: #FF0000;
			box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px rgba(0, 0, 0, 0.2);
		}
		.switch-input:checked ~ .switch-label:before {
			opacity: 0;
		}
		.switch-input:checked ~ .switch-label:after {
			opacity: 1;
		}
		.switch-handle {
			position: absolute;
			top: 4px;
			left: 4px;
			width: 28px;
			height: 28px;
			background: linear-gradient(to bottom, #FFFFFF 40%, #f0f0f0);
			background-image: -webkit-linear-gradient(top, #FFFFFF 40%, #f0f0f0);
			border-radius: 100%;
			box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
		}
		.switch-handle:before {
			content: "";
			position: absolute;
			top: 50%;
			left: 50%;
			margin: -6px 0 0 -6px;
			width: 12px;
			height: 12px;
			background: linear-gradient(to bottom, #eeeeee, #FFFFFF);
			background-image: -webkit-linear-gradient(top, #eeeeee, #FFFFFF);
			border-radius: 6px;
			box-shadow: inset 0 1px rgba(0, 0, 0, 0.02);
		}
		.switch-input:checked ~ .switch-handle {
			left: 74px;
			box-shadow: -1px 1px 5px rgba(0, 0, 0, 0.2);
		}

		/* Transition
        ========================== */
		.switch-label, .switch-handle {
			transition: All 0.3s ease;
			-webkit-transition: All 0.3s ease;
			-moz-transition: All 0.3s ease;
			-o-transition: All 0.3s ease;
		}
	</style>
	<title>Informations evaluation </title>
</head>
<body>


<article class="rightArticle">
	<%--Compte temporaire pour acceder --%>
	<div class="container">
        <h1> RESULTATS</h1>



		<form method="post" action="infosevaluation" id="evaluation">
			Veuillez choisir un groupe:		 <select class="form-control" name="groupetds" id="groupetds" >
			<option></option>
			<c:if test="${not empty groupes}">
				<c:forEach  items="${groupes}" var="group" >
					<option value="${group.idGroupe}">${group.nomGroupe}</option>
				</c:forEach>
			</c:if>
		</select>
			Veuillez choisir une evaluation:		   <select class="form-control" name="evaluations" id="evaluations">
			<option></option>
			<c:if test="${not empty evaluations}">
				<c:forEach  items="${evaluations}" var="evaluation" >
					<option value="${evaluation.idEvaluation}">${evaluation.domaine}(${evaluation.dateEvaluation})</option>
				</c:forEach>
			</c:if>
		</select>
		</form>
		<br><br>


		<br><br>
		<h3><b>Selectionnez  le  Groupe :  <a href=""  id="mine"></a>/ Seance du <a href="" id="mo"> </a></b></h3>
		<table id="example"  class="table table-striped table-bordered" width="100%" cellspacing="0">

			<thead>
			<tr>
				<th>Num_Etudiant</th>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Groupe</th>
				<th>Note</th>
			</tr>
			</thead>

			<tbody>
			<c:if test="${not empty eleves}">
				<c:forEach items="${eleves}"  var="eleve"  varStatus="status">
					<tr>
						<td>${eleve.idEleve}</td>
						<td>${eleve.nomEleve}</td>
						<td>${eleve.prenomEleve}</td>
						<td>${eleve.nomGroupe}</td>
						<td>${eleve.noteEleve}/${eleve.pointsMaxEvaluation}</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>

	</div>





	<script>
        $(document).ready(function(){
            $("#evaluations").change(function(){
                $("#evaluation").submit();
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
            $("#mine").append($("#groupetds option[value='${grselect}']").text()) ;
		</script>
	</c:if>


	<c:if test="${not empty evselect}">
		<script>
            $("#evaluations option[value='${evselect}']")[0].selected = true;
            $("#mo").append($("#evaluations option[value='${evselect}']").text()) ;
		</script>
	</c:if>


</article>

</body>
</html>