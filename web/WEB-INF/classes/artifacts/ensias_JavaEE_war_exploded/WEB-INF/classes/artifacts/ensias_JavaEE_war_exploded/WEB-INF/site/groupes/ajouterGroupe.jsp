<%--<!DOCTYPE>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../sharedData.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Gestion des groupes   </title>
</head>

<%--J'ai remplace index par Gestion--%>
<body>
<article class="rightArticle gestionEleve" style="border-bottom: none" id="rightArticle">
    <div class="topnav">
        <a href="<c:url value="/gestionGroupe?Rechercher"/>">Rechercher</a>
        <a  href="<c:url value="/gestionGroupe?Ajouter"/>" >Ajouter</a>
    </div>
    <form class="form-horizontal" method="post" action="<c:url value="/gestionGroupe"/>" >
        <br>
        <fieldset>
            <br><br>
            <!-- Form Name -->
            <legend style="margin-bottom: 30px;"><u>Ajout d'un groupe dans la base de donnée : </u></legend>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Nom : </label>
                <div class="col-md-4">
                    <input name="nomGroupe" id="nomGroupe" name="textinput" type="text" placeholder="Nom du groupe" class="form-control input-md">

                </div>
            </div>

            <!-- Textarea -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="description">Description du groupe : </label>
                <div class="col-md-4">
                    <textarea class="form-control" id="descriptionGroupe" name="descriptionGroupe">Une description si necessaire  sur le groupe </textarea>
                </div>
            </div>
            <input type="hidden" name="ajouterGroupe" value="ajouterGroupe"/>
        <input style="margin-left: 10px;" type="submit" id="ajouterGroupe" value="Ajouter ce groupe" onclick="alert('Le groupe a été ajouté avec succes ! ');" />
        </fieldset>

    </form>
</article>

</body>


</html>
