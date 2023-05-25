package org.example.controller;


import org.example.entity.*;
import org.example.repositories.GetResult;
import org.example.repositories.LoginRepo;
import org.example.repositories.StudentAnswerRepo;
import org.example.service.QuizService;
import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {

    StudentAnswerRepo studentAnswerRepo;
    LoginRepo loginRepo;
    QuizService quizService;

    GetResult getResult;

    static String username;
    static String squizname;

    static String aquizname;
    static String tquizname;

    static int warnings;

    String exQuiz;

    @Autowired
    public MainController(StudentAnswerRepo studentAnswerRepo, LoginRepo loginRepo, QuizService quizService, GetResult getResult) {
        this.studentAnswerRepo = studentAnswerRepo;
        this.loginRepo = loginRepo;
        this.quizService = quizService;
        this.getResult = getResult;
    }

    @GetMapping(path = "/")
    public String index() {
        return "First";
    }

    @GetMapping(path = "admin")
    public String ad() {
        return "admin";
    }

    @GetMapping(path = "makeQuiz")
    public String showResult() {
        return "AdminOptions";
    }

    @GetMapping(path = "showActiveQuiz")
    public String showActiveQuiz(ModelMap mp) {
        List<Quiz> quizzes = (List<Quiz>) quizService.findall();
        mp.addAttribute("allQuizes", quizzes);
        return "showAllQuizes";
    }

    @GetMapping(path = "createNewQuiz")
    public String createNewQuiz(ModelMap mp) {
        mp.addAttribute("quizName", new QuizName());
        List<String> quizzes = quizService.getQuiz();
        mp.addAttribute("allQuiz", quizzes);
        return "QuizDetails";
    }

    @PostMapping(path = "NameQuiz")
    public String nameQuiz(@ModelAttribute(value = "quizName") QuizName quizName) {
        squizname = quizName.getQuizName();
        List<String> quizNames = quizService.getDistinctQuiz();
        for (int i = 0; i < quizNames.size(); i++) {
            if (quizNames.get(i).equals(squizname)) {
                return "Exist";
            }
        }
        return "redirect:InputQuiz";
    }

    @RequestMapping(value = "InputQuiz")
    public String InputQuiz(@ModelAttribute(value = "quizName") QuizName quizName, ModelMap mp) {
        Quiz quiz = new Quiz();
        quiz.setQuizName(squizname);
        mp.addAttribute("Quiz", quiz);
        return "Quiz1";
    }

    @PostMapping(path = "save")
    public String chooseAnswer(@ModelAttribute(name = "Quiz") Quiz quiz) {
        quizService.save(quiz);
        return "redirect:InputQuiz";
    }

    @GetMapping(path = "student")
    public String selectQuiz(ModelMap mp) {
        List<String> getDistinctQuiz = quizService.getQuiz();
        mp.addAttribute("distinctQuiz", getDistinctQuiz);
        return "selectQuiz";
    }

    @RequestMapping(path = "Questions")
    public String student(ModelMap mp, @RequestParam(value = "code") String code) {
        aquizname = code;
        SecurityContext context = SecurityContextHolder.getContext();
        username = context.getAuthentication().getName();

        List<String> userList = quizService.getUser(code);
        for (String s : userList) {
            if (s.equals(username)) {
                return "QuizBlock";
            }
        }

        List<Quiz> list = quizService.getQuizByName(code);
        mp.addAttribute("allQues", list);
        return "QuizPage";
    }

    @PostMapping(value = "fromForm", headers = "Accept=application/json")
    public void getSearchResultViaAjax(@RequestBody String[] all) {
        System.out.println(Arrays.toString(all) + "/////////////////");
        for (int i = 0; i < all.length; i = i + 2) {
            StudentAnswers studentAnswers = new StudentAnswers();
            studentAnswers.setQid(Integer.parseInt(all[i]));
            studentAnswers.setAnswer(all[i + 1]);
            studentAnswers.setUsername(username);
            studentAnswers.setQuizName(aquizname);
            quizService.saveAns(studentAnswers);
        }
    }

    @RequestMapping(path = "Success")
    public String answer() {
        List<StudentAnswers> answers = quizService.findbyName(username, aquizname);
        List<Quiz> questions = quizService.getQuizByName(aquizname);
        int k = 0;
        for (int i = 0; i < questions.size(); i++) {
            if ((questions.get(i).getCorrectAns()).equals(answers.get(i).getAnswer())) {
                k++;
            }
        }
        Score score = new Score();
        score.setScore(k);
        score.setUsername(username);
        score.setQuizName(aquizname);
        score.setTimeOfQuiz(new Date());
        score.setWarnings(warnings);
        getResult.save(score);
        return "redirect:/logout";
    }

    @RequestMapping(path = "showResult")
    public String showAns(ModelMap mp) {
        List<String> q = quizService.getDistinctQuiz();
        mp.addAttribute("distinctQuiz", q);
        return "selectQuizResult";
    }

    @RequestMapping(path = "ShowFinalResult")
    public String showFinalResult(@RequestParam(value = "code") String code, ModelMap mp) {
        exQuiz = code;
        List<Score> scores = quizService.getAnswers(code);
        mp.addAttribute("allScore", scores);
        List<Quiz> quizzes = quizService.getQuizByName(code);
        int len = quizzes.size();
        mp.addAttribute("size", len);
        return "getAllScores";
    }

    @RequestMapping(path = "addTimer")
    public String addTimer(ModelMap mp) {
        List<String> quiz = quizService.getQuiz();
        mp.addAttribute("distinctQuiz", quiz);
        return "Timer1";
    }

    @RequestMapping(path = "SelectedQuiz")
    public String selectedQuiz(@RequestParam(value = "code") String code, ModelMap mp) {
        List<Quiz> quizzes = quizService.getQuizByName(code);
        tquizname = code;
        int size = quizzes.size();
        mp.addAttribute("questions", size);
        return "Timer2";
    }

    @RequestMapping(path = "SaveTimer")
    public String saveTimer(@RequestParam("time") int time) throws SQLException {
        quizService.setQuizTimer(tquizname, time);
        return "redirect:/logout";
    }

    @RequestMapping(path = "TimerAjax")
    public String getTime(ModelMap mp) {
        List<Quiz> quizzes = quizService.getQuizByName(aquizname);
        int time;
        time = quizzes.get(0).getQuizTimer();
        mp.addAttribute("Time", time);
        return "ajaxQuiz";
    }

    @PostMapping(value = "Warning", headers = "Accept=application/json")
    public void getSearchResultViaAjax1(@RequestBody String warn) {
        warnings = Integer.parseInt(warn);
    }


    @GetMapping("excel")
    public void exportIntoExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=Scores_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        List<Score> listOfRecords = quizService.getAnswers(exQuiz);

        ExcelGenerator generator = new ExcelGenerator(listOfRecords);

        generator.generate(response);
    }

}