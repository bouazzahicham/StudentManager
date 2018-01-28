<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%--Le chargement de la page avec les Beans--%>

<!DOCTYPE html>
<html>
<head>
    <title>Page de connexion</title>
    <meta charset="utf-8" />
    <link href="<c:url value="/inc/css/designConnexion.css"/>" type="text/css" rel="stylesheet" />

</head>

<body>
<jsp:include page="accueil.jsp"/>


<%--B--%>
<c:if test="${!empty erreursConnexion}">
<fieldset id="pageErreur">
    <c:forEach items="${erreursConnexion}" var="theError">
        <p class="ErreurConnexion"><c:out  value="${theError}"/></p>
    </c:forEach>
</fieldset>
</c:if>

<%--Cage de Connexion--%>
<fieldset id="pageConnexion" >
    <legend >Connexion :</legend>
    <form method="post" id="formConnexion" action='<c:url value="/connexion" context="/"/>'>
        <label id="usernameField">ID du  compte : <input type="text" name="username" ></label>
        <label id="passwordField"> Password : <input type="password" name="password" ></label>
        <input type="submit" name="submitConnexion" id="submitConnexion" >
    </form>
</fieldset>







</body>



</html>
