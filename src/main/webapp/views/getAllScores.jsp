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
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    padding: 20px;
  }

  h1 {
    text-align: center;
    margin-bottom: 20px;
  }

  h2 {
    text-align: center;
    margin-bottom: 20px;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
  }

  th {
    background-color: #f2f2f2;
  }

  form {
    display: flex;
    justify-content: center;
  }

   .green-button {
          background-color: green;
          color: white;
          margin: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 10vh;
          text-align: center;
      }

  input[type="submit"] {
    padding: 10px 20px;
    background-color: #3ce79a;
    color: #fff;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #c0392b;
  }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.js"></script>
<script>
  $(document).ready( function () {
    $('#varunview').DataTable();
  });
</script>
<title>Result</title>
</head>
<body>
  <h1> Number of Questions in Quiz = ${size} </h1>
  <h2>Quiz Report!!</h2>

    <form:form action="/excel" method="get">
    <input type="submit" value="Export To Excel" class="green-button">
    </form:form>
    <br><br>

  <table id="varunview">
    <thead>
      <tr>
        <th>Username</th>
        <th>Score</th>
        <th>Warnings</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="student" items="${allScore}">
        <tr>
          <td><c:out value="${student.username}"></c:out></td>
          <td><c:out value="${student.score}"></c:out></td>
          <td><c:out value="${student.warnings}"></c:out></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <br><br>
  <br><br><br>
  <form:form action="/logout" method ="post">
   <input type="submit" value="logout">
   </form:form>
   </body>
   </html>