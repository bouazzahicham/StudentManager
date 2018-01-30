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
        <a href="">Contact</a>
        <a href="#about">About</a>
    </div>

</article>
<form class="form-horizontal" action="<c:url value="/gestionEleve"/>">
    <form class="form-horizontal">
        <fieldset>

            <!-- Form Name -->
            <legend>Form Name</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Text Input</label>
                <div class="col-md-4">
                    <input id="textinput" name="textinput" type="text" placeholder="placeholder" class="form-control input-md">
                    <span class="help-block">help</span>
                </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="button1id">Double Button</label>
                <div class="col-md-8">
                    <button id="button1id" name="button1id" class="btn btn-success">Good Button</button>
                    <button id="button2id" name="button2id" class="btn btn-danger">Scary Button</button>
                </div>
            </div>

            <!-- Multiple Radios -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="radios">Multiple Radios</label>
                <div class="col-md-4">
                    <div class="radio">
                        <label for="radios-0">
                            <input type="radio" name="radios" id="radios-0" value="1" checked="checked">
                            Option one
                        </label>
                    </div>
                    <div class="radio">
                        <label for="radios-1">
                            <input type="radio" name="radios" id="radios-1" value="2">
                            Option two
                        </label>
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Text Input</label>
                <div class="col-md-4">
                    <input id="textinput" name="textinput" type="text" placeholder="placeholder" class="form-control input-md">
                    <span class="help-block">help</span>
                </div>
            </div>

        </fieldset>
    </form>


</body>



</html>