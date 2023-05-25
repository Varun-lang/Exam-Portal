package org.example.repositories;

import org.example.entity.StudentAnswers;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StudentAnswerRepo extends CrudRepository<StudentAnswers,Integer> {

    @Query(value = "select * from student_answers_quiz where username= ?1 and quiz_Name=?2",nativeQuery = true)
    List<StudentAnswers> findbyName(String username,String quizName);

    @Query(value = "select DISTINCT quiz_name from student_answers_quiz",nativeQuery = true)
    List<String> getDistinctQuiz();


}