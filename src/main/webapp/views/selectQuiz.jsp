<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Quiz</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    h1, h3 {
        color: #333;
    }

    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px;
    }

    button a {
        color: white;
        text-decoration: none;
    }

    button:hover {
        background-color: #45a049;
    }

    input[type="submit"] {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #3e8e41;
    }

     input[type="submit"][value="logout"] {
            background-color: #FF0000; /* New button color (red) */
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }


    body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                text-align: center;
            }

            h1 {
                color: #333333;
                font-size: 28px;
                margin-top: 30px;
            }

            h3 {
                color: #666666;
                font-size: 20px;
                margin-top: 20px;
            }

            b {
                color: #FF0000;
            }

            .rules-container {
                max-width: 600px;
                margin: 0 auto;
                padding: 30px;
                background-color: #FFFFFF;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                margin-top: 50px;
            }
</style>

<script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>

</head>
<body>
<div class="rules-container">
        <h1>Read all the Rules carefully before proceeding!!</h1>
        <h3>Do not switch tabs while giving the quiz.</h3>
        <h3><b>Do not try to hit refresh or back button otherwise your quiz will be automatically submitted.</b></h3>
        <h3>In case of any delinquency, contact the admin.</h3>
        <h3>Submit the quiz before the timer ends.</h3>
    </div>
    <br>
<h1> Choose Quiz </h1>
<c:forEach items="${distinctQuiz}" var="Ques">
<c:out value="${Ques}"/>  <button  type="button"><a href="Questions?code=<c:out value="${Ques}"/>">Start Quiz</a></button><br>
</c:forEach>
<br><br>

<form:form action="/logout" method ="post">
<input type="submit" value="logout">
</form:form>
</body>
</html>