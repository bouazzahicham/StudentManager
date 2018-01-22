<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Page de connexion</title>
    <meta charset="utf-8" />
    <link href="<c:url value="/inc/css/designConnexion.css"/>" type="text/css" rel="stylesheet" />

</head>

<body>
<%--B--%>

<%--Cage de connexion--%>
<fieldset id="pageConnexion" >
<legend >Connexion :</legend>
    <form id="formConnexion">
        <label id="usernameField">Username : <input type="text" name="username" ></label>
        <label id="passwordField"> Password : <input type="password" name="password" ></label>
        <input type="submit" name="submitConnexion" id="submitConnexion">
    </form>
</fieldset>






</body>



</html>
