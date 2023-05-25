<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz Running</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    .qn {
        font-weight: bold;
    }

    input[type="radio"] {
        margin-left: 10px;
    }

    #timer {
        font-size: 24px;
        font-weight: bold;
        color: red;
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
    p {
            color: red;
            font-size: 20px;
          }

    #countdown-container {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
          }
</style>

<script>
    let c;

    $(document).ready(function(){
        $.ajax(
            {
                type: "GET",
                url: "http://localhost:8081/TimerAjax",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                cache: false,
                success: function(data){
                    if(data.Minutes == 0){
                    c = 5;
                    }
                    else{
                    c = data.Minutes;
                    }
                  loop_func(c);
                },
                error: function(msg){
                    console.log("Error");
                }
            });
    })

var warn = 0;

    window.addEventListener("blur", blur);
    function blur(){
    warn = warn+1;
    alert("Tab Switching is Disabled!! \nWarning is sent to Admin.");
    }

    window.addEventListener("focus", () => {
        document.title = "Test Running";
    });

    const delay_func = ms => new Promise(res => setTimeout(res, ms))
    async function loop_func(c)
    {
        for (var i = c*60; i>0; i--)
        {
        document.getElementById("timer").innerHTML = i;
        await delay_func(1000);
        }
    saveFn();
    }


const arr =[];
function saveFn()
{
    window.removeEventListener("blur", blur);
    let qn = document.getElementsByClassName("qn");
    let correct_answer = document.getElementsByTagName("input");
    let counter = 0;
    for(let i=0;i<correct_answer.length;i++)
    {
        if(correct_answer[i].type == "radio" && correct_answer[i].checked)
        {
            arr.push(qn[counter].textContent);
            arr.push(correct_answer[i].value);
            counter++;
        }
    }

    $.ajax({
          url:  'fromForm',
          method: "POST",
          headers:{"Content-type":"application/json"},
          data:JSON.stringify(arr)
    });

    $.ajax({
              url:  'Warning',
              method: "POST",
              headers:{"Content-type":"application/json"},
              data:JSON.stringify(warn)
        });

    alert("Quiz Submitted Successfully!! Logging out in few seconds");
    location.href="Success";
}
</script>


</head>
<body>
<c:forEach items="${allQues}" var="Ques">
    <span class="qn"><c:out value="${Ques.id}"/></span><span>   <c:out value="${Ques.ques}"/></span><br><br>
    <span> (A) </span><input type="radio" name="${Ques.id}" value="${Ques.optionA}"><c:out value="${Ques.optionA}"/><br><br>
    <span> (B) </span><input type="radio" name="${Ques.id}" value="${Ques.optionB}"><c:out value="${Ques.optionB}"/><br><br>
    <span> (C) </span><input type="radio" name="${Ques.id}" value="${Ques.optionC}"><c:out value="${Ques.optionC}"/><br><br>
    <span> (D) </span><input type="radio" name="${Ques.id}" value="${Ques.optionD}"><c:out value="${Ques.optionD}"/><br><br>
</c:forEach>
<br><br>
<input type="submit" onclick="saveFn()" value="Submit"><br><br><br>
<div id="countdown-container">
<p> Time Left: <span id="timer"></span> seconds</p>
</div>
<form:form action="/logout" method ="post">
<input type="submit" value="logout">
</form:form>
</body>
</html>