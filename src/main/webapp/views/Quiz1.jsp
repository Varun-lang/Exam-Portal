<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Make Question</title>
<style>
        body {
            font-family: Arial, sans-serif;
        }

        form {
            margin: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        textarea {
            width: 400px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        a {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #337ab7;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<form:form action="save" method="post" modelAttribute="Quiz">
    Quiz Name : <form:input path="quizName" readonly="true"/> <br>
	<form:label path = "ques">Enter Question:</form:label>
    <form:textarea path = "ques" rows = "3" cols = "50" />
    <br>
    <form:label path = "optionA">Enter Option A:</form:label>
    <form:textarea path = "optionA" rows = "5" cols = "30" /><br>
    <form:label path = "optionB">Enter Option B:</form:label>
    <form:textarea path = "optionB" rows = "5" cols = "30" /><br>
    <form:label path = "optionC">Enter Option C:</form:label>
    <form:textarea path = "optionC" rows = "5" cols = "30" /><br>
    <form:label path = "optionD">Enter Option D:</form:label>
    <form:textarea path = "optionD" rows = "5" cols = "30" /><br><br>
    Choose Correct Option:<br>
    A <form:radiobutton path="correctAns" value="A"/><br>
    B <form:radiobutton path="correctAns" value="B"/><br>
    C <form:radiobutton path="correctAns" value="C"/><br>
    D <form:radiobutton path="correctAns" value="D"/><br><br>
	<input type="submit" onclick="myfn()" value="Add">
</form:form>

<h3>Add all the questions then add timer for the quiz! </h3>
<a href="/addTimer">Add Timer!</a>
<br><br><br>
<form:form action="/logout" method ="post">
<input type="submit" value="logout">
</form:form>

<script>
function myfn(){
alert("Added Successfully");
}
</script>

</body>
</html>