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

<title>NAHLA IS LOVE</title>
</head>


<body> 
<div class="container">


	<form method="post" action="index" id="groupe_tds">
	  	  <br><br>
		  <select class="form-control" name="groupetds" id="groupetds" >
		  <option></option>
		  </select>
	</form>	  
	
	
	<form method="post" action="index" id="seance">
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



<script>
$(document).ready(function(){
    $("#groupetds").change(function(){
    	 document.getElementById("groupe_tds").submit();
    });
});
</script>



<script>
$(document).ready(function(){
    $("#seances").change(function(){
    	 document.getElementById("seance").submit();
    });
});
</script>




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



</body>
</html>