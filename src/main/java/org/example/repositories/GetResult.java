package org.example.repositories;

import org.example.entity.Score;
import org.example.entity.StudentAnswers;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface GetResult extends CrudRepository<Score,Long> {

    @Query(value = "select * from Score where quiz_Name=?1",nativeQuery = true)
    List<Score> getAnswers(String quizName);

    @Query(value = "select username from score where quiz_name=?1",nativeQuery = true)
    List<String> getUser(String quizName);
}