package org.example.entity;

import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "StudentAnswers_Quiz")
public class StudentAnswers {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private int qid;
    private String answer;
    private String username;
    private String quizName;
}