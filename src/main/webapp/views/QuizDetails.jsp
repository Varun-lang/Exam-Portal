<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Quiz Details</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            h1 {
                margin-bottom: 20px;
            }

            form {
                margin-bottom: 20px;
            }

            table {
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
            }

            thead {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }

            a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #337ab7;
                color: white;
                text-decoration: none;
                border-radius: 4px;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.js"></script>
        <script>
            $(document).ready(function() {
                $('#varunview').DataTable();
            });
        </script>
    </head>

</head>

<body>
<h1> Name of the quiz must not match with any previous quiz names </h1>
<form:form action="NameQuiz" method="post" modelAttribute="quizName">
	Enter Quiz Name: <form:input path="quizName"/> <br>
	<input type="submit" value="Proceed">
</form:form>

<br><br><br>
<h1> Already Active Quiz's' <h1>
 <table id="varunview">
 <thead>
 <tr>
 <th>QuizName</th>
 </tr>
 </thead>
 <tbody>
 <c:forEach var="quiz" items="${allQuiz}">
 <tr>
 <td><c:out value="${quiz}"></c:out><br> </td>
 </tr>
 </c:forEach>
 </tbody>
 </table>
 <br><br>
 <form:form action="/logout" method ="post">
 <input type="submit" value="logout">
 </form:form>
 </body>
 </html>