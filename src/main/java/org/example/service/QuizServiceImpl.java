package org.example.service;

import org.example.entity.Quiz;
import org.example.entity.Score;
import org.example.entity.StudentAnswers;
import org.example.entity.User;
import org.example.repositories.GetResult;
import org.example.repositories.LoginRepo;
import org.example.repositories.QuizRepo;
import org.example.repositories.StudentAnswerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Service
public class QuizServiceImpl implements QuizService{


    StudentAnswerRepo studentAnswerRepo;

    QuizRepo quizRepo;

    GetResult getResult;

    @Autowired
    public QuizServiceImpl(StudentAnswerRepo studentAnswerRepo, QuizRepo quizRepo, GetResult getResult) {
        this.studentAnswerRepo = studentAnswerRepo;
        this.quizRepo = quizRepo;
        this.getResult = getResult;
    }

    @Override
    public void save(Quiz quiz) {
        String ch = quiz.getCorrectAns();
        String ans="";
        switch(ch){
            case "A":
                ans=quiz.getOptionA();
                break;
            case "B":
                ans=quiz.getOptionB();
                break;
            case "C":
                ans=quiz.getOptionC();
                break;
            case "D":
                ans=quiz.getOptionD();
                break;
        }
        quiz.setCorrectAns(ans);
        quizRepo.save(quiz);
    }

    @Override
    public List<Quiz> getAll() {
        List<Quiz> list = (List<Quiz>) quizRepo.findAll();
        return list;
    }

    @Override
    public void saveAns(StudentAnswers studentAnswers) {
        studentAnswerRepo.save(studentAnswers);
    }

    @Override
    public Iterable<Quiz> findall() {
        return quizRepo.findAll();
    }

    @Override
    public Iterable<StudentAnswers> findAnswers() {
        return studentAnswerRepo.findAll();
    }

    @Override
    public List<String> getQuiz() {
        List<String>getQuiz = quizRepo.getQuiz();
        return getQuiz;
    }

    @Override
    public List<Quiz> getQuizByName(String quizName) {
        List<Quiz>quizzes = quizRepo.getQuizByName(quizName);
        return quizzes;
    }

    @Override
    public List<StudentAnswers> findbyName(String username, String quizName) {
        List<StudentAnswers> answers = studentAnswerRepo.findbyName(username,quizName);
        return answers;
    }

    @Override
    public void setQuizTimer(String quizName, int time) throws SQLException {
        //quizRepo.setQuizTimer(quizName,time);
        String insertQuery ="update varun_quiz set quiz_Timer= ? where quiz_name = ?";
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/quiz","root","root");
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setInt(1,time);
        preparedStatement.setString(2,quizName);
        preparedStatement.execute();
    }

    @Override
    public List<String> getDistinctQuiz() {
        return studentAnswerRepo.getDistinctQuiz();
    }

    @Override
    public List<Score> getAnswers(String quizName) {
        return getResult.getAnswers(quizName);
    }

    @Override
    public List<String> getUser(String quizName) {
        return getResult.getUser(quizName);
    }

}