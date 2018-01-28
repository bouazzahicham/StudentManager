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
<article class="rightArticle">

    <h3>Page d'activitées : </h3>
        <div class="activity-feed">
            <div class="feed-item">
                <div class="date">Sep 25</div>
                <div class="text">Responded to need <a href="single-need.php">“Volunteer opportunity”</a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 24</div>
                <div class="text">Added an interest “Volunteer Activities”</div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 23</div>
                <div class="text">Joined the group <a href="single-group.php">“Boardsmanship Forum”</a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 21</div>
                <div class="text">Responded to need <a href="single-need.php">“In-Kind Opportunity”</a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 18</div>
                <div class="text">Created need <a href="single-need.php">“Volunteer Opportunity”</a></div>
            </div>
            <div class="feed-item">
                <div class="date">Sep 17</div>
                <div class="text">Attending the event <a href="single-event.php">“Some New Event”</a></div>
            </div>
        </div>
</article>


</body>



<footer>



</footer>



</html>
