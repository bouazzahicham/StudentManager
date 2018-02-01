<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="sharedData.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/inc/css/designFeed.css"/>" type="text/css" rel="stylesheet"/>
    <%--A nettoyer --%>
    <title>Page d'accueil </title>

    <meta charset="utf-8" />
</head>

<body>
<article class="rightArticle" id="rightArticle">
    <p> Message d'accueil </p>
    <%--C'est cette partie qui sera redéfini pour toute les autres pages--%>
</article>
<article class="rightArticle">

    <h3>Page d'activitées : </h3>
        <div class="activity-feed">
            <div class="feed-item">
                <div class="date">Sep 25</div>
                <div class="text">Nouvelle 1 :  <a href="http://ensias.ma"> ensias.ma</a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 24</div>
                <div class="text">Nouvelle 2 : JavaEE a 11h  </div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 23</div>
                <div class="text"><a href="">“Life is plastic</a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 21</div>
                <div class="text"> <a href="">“life is fantastic”</a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 18</div>
                <div class="text"><a href="">You can brush my hair </a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 17</div>
                <div class="text">Attending the event <a href="">“ event”</a></div>
            </div>
        </div>
</article>


</body>



<footer>



</footer>



</html>
