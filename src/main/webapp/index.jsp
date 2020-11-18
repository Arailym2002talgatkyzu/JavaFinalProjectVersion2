<%--
  Created by IntelliJ IDEA.
  User: arail
  Date: 11/17/2020
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="false" %>
<html>
<head>
    <title>Home Page</title>
    <style>
        body{
            background-image: url("main.jpg");

            background-repeat: no-repeat;
            background-size: cover;
        }
        .form{
            background-color: rgba(255, 255, 255, 0.4);
            border-radius: 10px;
            width: 500px;
            margin-left: 40%;
            margin-top: 20%;
            margin-bottom: 20%;
            padding: 11px;
        }
        input{
            padding: 5px;
            text-align: center;
            border-radius: 5px;
            margin-left: 10%;
            width: 200px;
        }
        form{
            margin-left: 20%;
        }
    </style>
</head>
<body>
<div class="form">
    <form method="post" action="loginServlet">
        <h2 style="text-align: center; font-family: Georgia; color: lightslategray">Portal Login</h2>
        <input type="text" placeholder="username" name="username"><br><br>
        <input type="password" placeholder="password" name="password"><br><br>
        <input type="submit" value="Login" style="width: 80px; background-color: lightskyblue">
    </form>
</div>
</body>
</html>