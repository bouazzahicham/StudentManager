<%--<!DOCTYPE>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../sharedData.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Gestion des eleves  </title>
</head>

<%--J'ai remplace index par Gestion--%>
<body>
<article class="rightArticle gestionEleve" style="border-bottom: none" id="rightArticle">
    <div class="topnav">
        <a href="<c:url value="/gestionEleve?Rechercher"/>">Rechercher</a>
        <a  href="<c:url value="/gestionEleve?Ajouter"/>" >Ajouter</a>
    </div>
</article>

<div id="ajoutEleve">
    <form class="form-horizontal" method="post" action="<c:url value="/gestionEleve"/>" >
        <fieldset>
            <!-- Form Name -->
            <legend style="margin-bottom: 30px;"><u>Ajout d'un étudiant dans la base de donnée : </u></legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Nom : </label>
                <div class="col-md-4">
                    <input name="nomEleve" id="nomEleve" name="textinput" type="text" placeholder="Nom de l'élève" class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="prenom">Prenom :</label>
                <div class="col-md-4">
                    <input id="prenomEleve" name="prenomEleve" type="text" placeholder="Prenom de l'eleve" class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="dateNaissance">Date de naissance : </label>
                <div class="col-md-4">
                    <input id="dateNaissance" name="dateNaissance" type="text" placeholder="" class="form-control input-md">
                    <span class="help-block">format : JJ-MM-AAAA</span>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="telephone">Telephone :</label>
                <div class="col-md-4">
                    <input id="telephone" name="telephone" type="text" placeholder="" class="form-control input-md">

                </div>
            </div>

            <!-- Textarea -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="description">Description : </label>
                <div class="col-md-4">
                    <textarea class="form-control" id="description" name="description">Une description si necessaire sur l'étudiant </textarea>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="ville">Ville actuelle : </label>
                <div class="col-md-4">
                    <input id="ville" name="ville" type="text" placeholder="" class="form-control input-md">

                </div>
            </div>
            <!-- Select Basic -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="selectGroupe">Choix du groupe : </label>
                <div class="col-md-6">

                    <select id="selectGroupe" name="selectGroupe" class="form-control">
                        <c:forEach var="groupe" items="${groupeListe}" varStatus="varstatus">
                            <option value="${groupe.idGroupe}">${groupe.nomGroupe}</option>
                        </c:forEach>
                    </select>


                </div>
            </div>
        </fieldset>
        <input style="margin-left: 100px;" type="submit" id="ajouterEleve" value="Ajouter cette eleve" onclick="alert('L\'eleve ajouté avec succes ! ');" />

        <input type="hidden" name="ajouterEleve" value="ajouterEleve"   >
    </form>


</div>

</body>

</html>
