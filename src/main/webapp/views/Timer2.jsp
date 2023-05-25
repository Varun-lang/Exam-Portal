<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Timer</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 30px;
    }

    form {
        text-align: center;
        margin-top: 50px;
    }

    input[type="text"] {
        padding: 10px;
        width: 200px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
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
<script>
function saveTimer(){
    alert("Timer Added Successfully\n Logging You out!");
    location.href="SaveTimer";
}
</script>
</head>
<body>
<h1> Enter time in minutes for the selected Quiz!! </h1>
<form action="SaveTimer" method="post" >
    Number of Questions in Quiz : ${questions}   <br><br><br>
	<input type="text" name="time" value="">
    <input type="submit" onclick=saveTimer() value="Save">
</form>
</body>
</html>