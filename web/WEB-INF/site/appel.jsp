<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Gestion groupe </title>
</head>

<%--J'ai remplace index par Gestion--%>
<body>
<jsp:include page="accueil.jsp"/>

<article class="rightArticle">
<div class="container">
	<form method="post" action="Gestion" id="groupe_tds">
		<br><br>
		<select class="form-control" name="groupetds" id="groupetds" >
			<option></option>
		</select>
	</form>


	<form method="post" action="Gestion" id="seance">
		<br><br>
		<select class="form-control" name="seances" id="seances">
			<option></option>
		</select>
	</form>


	<form method="post" action="students" id="etudiants_groupe">
		<div class="form-group">
			<br><br>
			<table id="example" class="table table-striped table-bordered" width="100%" cellspacing="0">

				<thead>
				<tr>
					<th>Num_Etudiant</th>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Absence</th>
				</tr>
				</thead>

				<tbody>

				</tbody>

			</table>
			<input type="submit" class="btn btn-primary" value="Submit Button">
		</div>
	</form>
</div>






<c:if test="${not empty mygroups}">
	<c:forEach  items="${mygroups}" var="group">
		<script>
            $(document).ready(function()
            {
                var z = document.createElement("option");
                z.setAttribute("value","${group.nom_groupe}");
                var t = document.createTextNode("${group.nom_groupe}");
                z.appendChild(t);
                document.getElementById("groupetds").appendChild(z);
            });
		</script>
	</c:forEach>
</c:if>


<c:if test="${not empty messeances}">
	<c:forEach  items="${messeances}" var="seance" >
		<script>
            $(document).ready(function()
            {
                var zo = document.createElement("option");
                zo.setAttribute("value","${seance.nom_seance}");
                var to = document.createTextNode("${seance.nom_seance}" );
                zo.appendChild(to);
                document.getElementById("seances").appendChild(zo);
            });
		</script>
	</c:forEach>
</c:if>



<c:if test="${not empty etudiants}">
	<c:forEach items="${etudiants}"  var="etudiant"  varStatus="status">
		<script>
            $(document).ready(function()
            {
                var r=document.createElement("tr");

                var z1 = document.createElement("td");
                z1.setAttribute("value","${etudiant.id}");
                var t1 = document.createTextNode("${etudiant.id}");
                z1.appendChild(t1);

                var z2 = document.createElement("td");
                z2.setAttribute("value","${etudiant.nom}");
                var t2 = document.createTextNode("${etudiant.nom}");
                z2.appendChild(t2);

                var z3 = document.createElement("td");
                z3.setAttribute("value","${etudiant.prenom}");
                var t3= document.createTextNode("${etudiant.prenom}");
                z3.appendChild(t3);

                var z4 = document.createElement("td");
                z4.innerHTML=" <label class='switch'>" +
                    " <input class='switch-input' type='checkbox' /> <span class='switch-label' data-on='OUI' data-off='NON'></span>  <span class='switch-handle'></span>  </label>";


                r.appendChild(z1);
                r.appendChild(z2);
                r.appendChild(z3);
                r.appendChild(z4);

                document.getElementById("example").getElementsByTagName("tbody")[0].appendChild(r);

            });
		</script>

	</c:forEach>

	<script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable();
        });
	</script>

</c:if>


</article>
</body>
</html>