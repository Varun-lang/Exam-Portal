<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      text-align: center;
      padding-top: 20px;
    }

    h1 {
      color: #333;
      font-size: 28px;
      margin-bottom: 10px;
    }

    .w {
      font-weight: normal;
    }

    .main {
      display: flex;
      justify-content: center;
      padding-top: 5%;
      margin-bottom: 20px;
    }

    .button {
      display: inline-block;
      width: 250px;
      height: 40px;
      margin: 0 10px;
      border: none;
      border-radius: 5px;
      background-color: #3498db;
      color: #fff;
      font-size: 16px;
      font-weight: bold;
      text-align: center;
      text-decoration: none;
      line-height: 40px;
      transition: background-color 0.3s ease;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    .button:hover {
      background-color: #2980b9;
    }

    .button:active {
      background-color: #1f618d;
    }

    form {
      display: flex;
      justify-content: center;
    }

    input[type="submit"] {
      display: inline-block;
      padding: 10px 20px;
      background-color: #e74c3c;
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

  <meta charset="utf-8">
  <meta name="Homepage" content="Starting page for the survey website ">
  <title>HomePage</title>
</head>

<body>
  <div id="divv">
    <h1>Welcome!</h1>
    <h1 class="w">Select Your Role!</h1>
  </div>
  <div class="main">
    <a href="student" class="button">Student</a>
    <a href="admin" class="button">Admin</a>
  </div>
  <form:form action="/logout" method="post">
    <input type="submit" value="Logout">
  </form:form>
</body>

</html>