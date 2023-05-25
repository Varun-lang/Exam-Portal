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
@Table(name = "Varun_Quiz")
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(length = 10000)
    private String ques;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String correctAns;
    private String quizName;
    private int quizTimer;
}