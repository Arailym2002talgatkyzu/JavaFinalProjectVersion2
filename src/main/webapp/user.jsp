<%@ page import="Repositories.EventRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Contents.Event" %>
<%@ page import="Repositories.ClubRepository" %>
<%@ page import="Repositories.NewsRepository" %>
<%@ page import="Contents.Club" %>
<%@ page import="Contents.News" %>
<%@ page import="Model.Student" %>
<%@ page import="Repositories.studentSelector" %><%--
  Created by IntelliJ IDEA.
  User: arail
  Date: 11/17/2020
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Page</title>
    <link rel="stylesheet" type="text/css" href="user.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script>
        $(document).ready(function(){
            $('#searchBy').click(function(){
                $.ajax({
                    url: 'searchServlet',
                    type: 'POST',
                    data: {search: $("#searchMessage").val(), query: $("#option").val()},
                    success: function (data) {
                        $('#studentList').empty();
                        var res = data;
                        for (let i = 0; i < data.length; i++) {
                            $('#studentList').append(
                                '<div class="studentItems"><img class="student-ava"src="' + res[i].avatar + '">\n' +
                                '<span class="student-name">' + res[i].name + ' ' + res[i].surname + ' ' + res[i].group + '\n' +
                                '</span></div>'
                            );
                        }
                    }
                })
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#event").click(function()
            {
                event.preventDefault();
                $('#newsItems, #clubItems').hide();
                $('#eventItems').show();
            });
            $("#news").click(function()
            {
                event.preventDefault();
                $('#newsItems').show();
                $('#eventItems, #clubItems').hide();
            });
            $("#clubs").click(function()
            {
                event.preventDefault();
                $('#clubItems').show();
                $('#eventItems, #newsItems').hide();
            })})
    </script>
</head>
<header>
    <div><img class="user-ava"src="<c:out value="${sessionScope.user.avatar}"/>"></div>
    <div class="user-name"><span><a href="profile.jsp" style="text-decoration: none"> <c:out value="${sessionScope.user.name}"/> <c:out value="${sessionScope.user.surname}"/></a></span></div>
    <div class="searchEngine">
            <input type="text" name="search"  id="searchMessage" placeholder="search for students" >
            <select name="query" id="option">
                <option value="1">by Name</option>
                <option value="2">by Surname</option>
                <option value="3">by Group</option>
                <option value="4">by Major</option>
                <option value="5">by Year</option>
                <option value="6">by Email</option>
                <option value="7">All</option>
            </select><br>
            <input type="submit" id="searchBy" value="search">
    </div>
    <div class="user-button"><a href="logout.jsp">Log Out</a></div>
</header>
<body>
<%! private studentSelector selector=new studentSelector();
    private ArrayList<Student> listOfStudents;
%>
<% listOfStudents= (ArrayList<Student>) selector.selectAll();%>
<aside class="students" >
    <div class="listWrapper" id="studentList">
        <%for (Student student:listOfStudents){ %>
        <div class="studentItems" id="">
            <img class="student-ava" src="<%=student.getAvatar()%>">
            <span class="student-name"><%=student.getName()+" "+ student.getSurname()+" "+student.getGroup()%></span>
        </div><%}%>
    </div>
</aside>
<%EventRepository eventRepository=new EventRepository();
    ClubRepository clubRepository=new ClubRepository();

    NewsRepository newsRepository=new NewsRepository();
    ArrayList<Club>listOfClubs= (ArrayList<Club>) clubRepository.showClubs();
    ArrayList<News>listOfNews= (ArrayList<News>) newsRepository.showNews();
    ArrayList<Event>listOfEvents= (ArrayList<Event>) eventRepository.showEvents();

%>
<section class="content">
    <div id="eventItems">
           <% for (Event event:listOfEvents){ %>
            <article class="eventArticle">
            <aside class="eventMessage">
                <p><h3><%=event.getTitle()%></h3> <p>
                <p>Event Date: <%=event.getDate()%></p>
                <p>Organizator: <%=event.getOwner()%></p>
            </aside>
            <img class="eventImage"src="<%=event.getUrl()%>">
        </article>
           <%}%>

    </div >

    <div id="newsItems">
        <%for(News news:listOfNews){%>
        <article class="newsArticle">
            <aside class="newsMessage">
                <p style="color: grey"> <%=news.getDate()%> </p>
                <p><b><%=news.getTitle()%></b> <p>
                <p><i>Published by: <%=news.getOwner()%></i></p>
            </aside>
            <img class="newsImage"src="<%=news.getUrl()%>">
        </article><%}%>
    </div>

    <div id="clubItems">
        <% for (Club club:listOfClubs){ %>
        <article class="clubArticle">
            <aside class="clubMessage">
                <p><b><%=club.getTitle()%></b> <p>
                <p> Creation time: <%=club.getDate()%> </p>
                <p> Owner: <%=club.getOwner()%></p>
            </aside>
            <img class="newsImage"src="<%=club.getUrl()%>">
        </article><%}%>
    </div>

</section>
<div class="navigator">
    <button id="event">EVENTS</button><br>
    <button id="news">NEWS</button><br>
    <button id="clubs">CLUBS</button>
</div>
</body>
</html>
