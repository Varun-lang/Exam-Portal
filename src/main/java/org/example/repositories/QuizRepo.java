package org.example.repositories;

import org.example.entity.Quiz;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuizRepo extends CrudRepository<Quiz,Integer>
{

    @Query(value = "select DISTINCT quiz_name from varun_quiz",nativeQuery = true)
    List<String> getQuiz();

    @Query(value = "select * from varun_quiz where quiz_name = ?1",nativeQuery = true)
    List<Quiz> getQuizByName(String quizName);

}