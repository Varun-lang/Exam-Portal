<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.js"></script>
<script>
$(document).ready( function () {
$('#varunview').DataTable();
} );
</script>
<title>Active Quiz</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    h2 {
        text-align: center;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 30px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    form {
        text-align: center;
        margin-bottom: 30px;
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
        background-color: #45a049;
    }
</style>
</head>

<body>
<h2 align="center">Quiz Report!!</h2>

 <table id="varunview" table style="width:100%">
 <thead>
 <tr>
 <th>Question</th>
 <th>option A</th>
 <th>option B</th>
 <th>option C</th>
 <th>option D</th>
 <th>Correct Answer</th>
 <th>Quiz Name</th>
 </tr>
 </thead>
 <tbody>
 <c:forEach var="quiz" items="${allQuizes}">
 <tr>
 <td><c:out value="${quiz.ques}"></c:out><br> </td>
 <td><c:out value="${quiz.optionA}"></c:out><br> </td>
 <td><c:out value="${quiz.optionB}"></c:out><br> </td>
 <td><c:out value="${quiz.optionC}"></c:out><br> </td>
 <td><c:out value="${quiz.optionD}"></c:out><br> </td>
 <td><c:out value="${quiz.correctAns}"></c:out><br> </td>
 <td><c:out value="${quiz.quizName}"></c:out><br> </td>
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