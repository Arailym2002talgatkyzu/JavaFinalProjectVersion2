<%@ page import="Repositories.EventRepository" %>
<%@ page import="Repositories.ClubRepository" %>
<%@ page import="Repositories.NewsRepository" %>
<%@ page import="Contents.Club" %>
<%@ page import="Contents.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Contents.Event" %>
<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: arail
  Date: 11/17/2020
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="profile.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script>
        function deleteEvent(id) {
            $.ajax({
                url: "deleteEvent",
                type: "POST",
                data: {
                    id: id
                }, accepts: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function (data) {
                    location.reload()
                }
            });
        }
        function deleteNews(id) {
            $.ajax({
                url: "deleteNews",
                type: "POST",
                data: {
                    id: id
                }, accepts: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function (data) {
                    location.reload()
                }
            });
        }
        function deleteClub(id) {
            $.ajax({
                url: "deleteClub",
                type: "POST",
                data: {
                    id: id
                }, accepts: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function (data) {
                    location.reload()
                }
            });
        }
    </script>
</head>
<body  class="profile-page" style="margin-top: 200px">
<div data-parallax="true"1></div>
<div class="main main-raised">
    <div class="profile-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ml-auto mr-auto">
                    <div class="profile">
                        <div class="avatar">
                            <img src="<c:out value="${sessionScope.user.avatar}"/>" alt="Circle Image" class="img-raised rounded-circle img-fluid">
                        </div>
                        <div class="name">
                            <h3 class="title"><c:out value="${sessionScope.user.name}"/></h3>
                            <h6>Major:<c:out value="${sessionScope.user.major}"/></h6>
                            <h6>Email:<c:out value="${sessionScope.user.email}"/></h6>
                            <h6>Group:<c:out value="${sessionScope.user.group}"/></h6>
                            <a href="user.jsp">Main</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="description text-center">
                <p>Keep Pushin! U can do it!</p>
            </div>
        </div>
    </div>
</div>
<%
    User user= (User) request.getSession().getAttribute("user");
    EventRepository eventRepository=new EventRepository();
    ClubRepository clubRepository=new ClubRepository();
    NewsRepository newsRepository=new NewsRepository();
    ArrayList<Club>userClubs= (ArrayList<Club>) clubRepository.showUserClubs(user.getUsername());
    ArrayList<News> userNews= (ArrayList<News>) newsRepository.showUserNews(user.getUsername());
    ArrayList<Event>userEvents= (ArrayList<Event>) eventRepository.showUserEvents(user.getUsername());

%>
<div  class="profile-page" style="margin-top: 150px">
    <div data-parallax="true"></div>
    <div class="main main-raised">
        <div class="profile-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 ml-auto mr-auto">
                        <div class="profile">
                            <div >
                                <h2>News</h2>
                                <a href="addNewsForm.jsp" class="fancy-btn" style="color: black; font-size: 1.2em; margin-top: 0px;">Add News</a>
                                <h2>My News</h2>
                                <ol class="list-group">
                                    <%
                                        for (News news: userNews) {
                                    %>
                                    <li class="list-group-item d-flex justify-content-between align-items-center"> <%=news.getId()+news.getTitle()%> <span class="badge badge-primary badge-pill"></span></li><hr>
                                    <img src="<%=news.getUrl()%>" width="100px" height="100px">
                                    Publication Date:<%=news.getDate()%>
                                    <a href="editNews.jsp" class="fancy-btn" style="color: black; font-size: 1.2em; margin-top: 0px;">Edit News</a>
                                    <button class="fancy-btn" type="button" id="deleteButton" style="color: black; font-size: 1.2em; margin-top: 0px;" onclick="deleteNews(<%=news.getId()%>)">Delete</button>
                                    <%
                                        }
                                    %>
                                </ol>

                            </div><br>
                            <div >
                                <h2>Events</h2>
                                <a href="addEventForm.jsp" class="fancy-btn" style="color: black; font-size: 1.2em; margin-top: 0px;">Add event</a>
                                <h2>My Events</h2>
                                <ol class="list-group">
                                    <%
                                        for (Event event: userEvents) {
                                    %>
                                    <li class="list-group-item d-flex justify-content-between align-items-center"><%=event.getId()+ event.getTitle()%> <span class="badge badge-primary badge-pill"></span></li><hr>
                                    <img width="100px" height="100px" src="<%=event.getUrl()%>">
                                    Event date:<%=event.getDate()%>
                                    <a href="editEvent.jsp" class="fancy-btn" style="color: black; font-size: 1.2em; margin-top: 0px;">Edit Event</a>
                                    <button class="fancy-btn" type="button" id="deleteButton" style="color: black; font-size: 1.2em; margin-top: 0px;" onclick="deleteEvent(<%=event.getId()%>)">Delete</button>
                                    <%
                                        }
                                    %>
                                </ol>
                            </div><br>
                            <div>
                                <h2>Clubs</h2>
                                <a href="addClubForm.jsp" class="fancy-btn" style="color: black; font-size: 1.2em; margin-top: 0px;">Add Club</a>
                                <h2>My Events</h2>
                                <ol class="list-group">

                                    <%
                                        for (Club club: userClubs) {
                                   %>
                                    <li class="list-group-item d-flex justify-content-between align-items-center"><%=club.getId()+club.getTitle()%> <span class="badge badge-primary badge-pill"></span></li><hr>
                                    <img src="<%=club.getUrl()%>"width="100px"height="100px">
                                    Creation Time: <%=club.getDate()%>
                                    <a href="editClub.jsp" class="fancy-btn" style="color: black; font-size: 1.2em; margin-top: 0px;">Edit Club</a>
                                    <button class="fancy-btn" type="button" id="deleteButton" style="color: black; font-size: 1.2em; margin-top: 0px;" onclick="deleteClub(<%=club.getId()%>)">Delete</button>
                                    <%
                                        }
                                    %>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<footer class="footer" style="margin-top: 110px;">
    <div style="width: 100%; float: left;">
        <div style="width: 50%; float: left;">
            <div class="footer__addr">
                <h2 class="footer__logo" style="color: #076072; font-size: 1.6em; margin-top: 20px;">stay healthy</h2>
                <h2>Contacts:</h2>
                <address>
                    Address: 14 Sleepless Nights, Deep Love<br>
                    <a class="footer__btn" href="mailto:tomiris.tl@gmail.com">Email Us</a>
                </address>
            </div> </div>

    </div>
    <div class="legal">
        <p>&copy; 2020 Astana IT University. All rights reserved.</p>
        <div class="legal__links">
            <span>Made with <span class="heart">♥</span> by SE-1901's Girls</span>
        </div>
    </div>
</footer>

</body>
</html>
