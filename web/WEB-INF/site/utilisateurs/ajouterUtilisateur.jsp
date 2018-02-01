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
        <a href="<c:url value="/gestionUtilisateur?Rechercher"/>">Rechercher</a>
        <a  href="<c:url value="/gestionUtilisateur?Ajouter"/>" >Ajouter</a>
    </div>
</article>

<div id="ajoutEleve">
    <form class="form-horizontal" method="post" action="<c:url value="/gestionUtilisateur"/>" >
        <fieldset>
            <!-- Form Name -->
            <legend style="margin-bottom: 30px;"><u>Ajout d'un utilisateur dans la base de donnée : </u></legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Nom : </label>
                <div class="col-md-4">
                    <input name="nomProprietaire" id="nomProprietaire"  type="text" placeholder="Nom du proprietaire " class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="prenom">Prenom :</label>
                <div class="col-md-4">
                    <input id="prenomProprietaire" name="prenomProprietaire" type="text" placeholder="Prenom du proprietaire" class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="idUtilisateur">ID Utilisateur : </label>
                <div class="col-md-4">
                    <input id="idUtilisateur" name="idUtilisateur" type="text" placeholder="" class="form-control input-md">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="ville">Mot de passe  : </label>
                <div class="col-md-4">
                    <input id="motdePasse" name="motdePasse" type="text" placeholder="" class="form-control input-md">

                </div>
            </div>


            <!-- Textarea -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="description">Description : </label>
                <div class="col-md-4">
                    <textarea class="form-control" id="description" name="descriptionUtilisateur">Une description si necessaire  </textarea>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label" for="ville">Type Profil : </label>
                <div class="col-md-4">
                    <input type=text list=idProfil >
                    <datalist id=idProfil name="idProfil">
                        <option value="-1"> Acces refusé
                        <option value="0"> Compte normal
                        <option value="1"> Compte administrateur
                    </datalist>
                </div>


        </fieldset>
        <input style="margin-left: 100px;" type="submit" id="ajouterEleve" value="Ajouter cette eleve" onclick="alert('L\'eleve ajouté avec succes ! ');" />
        <input type="hidden" name="ajouterUtilisateur" value="ajouterUtilisateur"   >
    </form>


</div>

</body>

</html>
