<!doctype html>
<html lang="en">

<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }

    .main {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .button-container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .button {
      display: block;
      width: 250px;
      height: 40px;
      margin-bottom: 10px;
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

    .button:first-child {
      margin-top: 10px;
    }

    .button:last-child {
      margin-bottom: 0;
    }
  </style>
  <meta charset="utf-8">
  <meta name="Homepage" content="Starting page for the survey website ">
  <title>HomePage</title>
</head>

<body>
  <div class="main">
    <div class="button-container">
      <a href="makeQuiz" class="button">Make Quiz</a>
      <a href="showResult" class="button">Show Result</a>
      <a href="addTimer" class="button">Edit Timer</a>
    </div>
  </div>
</body>

</html>