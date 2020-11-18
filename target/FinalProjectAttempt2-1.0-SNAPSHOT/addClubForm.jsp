<%--
  Created by IntelliJ IDEA.
  User: arail
  Date: 11/17/2020
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <title>Add Club!!!</title>
</head>
<body>
<style>
    body {
        background-image: url("https://s53.radikal.ru/i141/1103/26/5625ab6b3fe1.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>
<div class="container container-login" style = "margin-top: 10px; color: #fff;">
    <div class="col-md-8" style="margin-left: 150px">
        <form method="post" action="addClub">
            <h3 style="background-color: rgba(255, 61, 61, 0.568); height: 50px; text-align: center; padding: 5px"><b>Add Club</b></h3>
            <div class="form-group">
                <label for="exampleInputEmail2">Title</label>
                <input type="text" name="title" class="form-control" id="exampleInputEmail2">
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">URL</label>
                <input type="text" name="url" class="form-control" id="exampleFormControlTextarea1">
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Date</label>
                <input type="text" name="date" class="form-control" id="exampleFormControlTextarea2">
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Owner</label>
                <input type="text" name="owner" class="form-control" id="exampleFormControlTextarea3">
            </div>
            <button style="width: 100%; height: 42px; text-align: center; font-size: 1.1em;
                background-color: rgba(255, 61, 61, 0.668); color: white" type="submit" class="btn btn-primary1" id="register">Save</button>

        </form>
    </div>
</div>
</body>
</html>
