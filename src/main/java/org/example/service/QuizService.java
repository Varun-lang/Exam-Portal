package org.example.service;

import org.example.entity.Quiz;
import org.example.entity.Score;
import org.example.entity.StudentAnswers;
import org.example.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface QuizService {

    void save(Quiz quiz);

    List<Quiz> getAll();

    void saveAns(StudentAnswers studentAnswers);

    Iterable<Quiz> findall();
    Iterable<StudentAnswers> findAnswers();

    List<String> getQuiz();

    List<Quiz> getQuizByName(String quizName);

    List<StudentAnswers> findbyName(String username,String quizName);

    void setQuizTimer(String quizName,int time) throws SQLException;

    List<String> getDistinctQuiz();

    List<Score> getAnswers(String quizName);

    List<String> getUser(String quizName);

}