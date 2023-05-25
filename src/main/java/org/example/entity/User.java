package org.example.entity;

import lombok.*;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode

@Entity
@Table(name = "user_varun")
public class User {
    @Id
    //@GeneratedValue(strategy = GenerationType.AUTO)
    private long EmpId;
    private String username;
    private String password;
    private String role;
}