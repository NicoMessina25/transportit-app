package com.funmesseg.transportit.model;

import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "_user")
@Getter
@Setter
@NoArgsConstructor
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "_user")
    private Long user;

    @Column
    private String firstname;

    @Column
    private String lastname;

    @Column 
    private String username;

    @Column
    private String password;

    @Column
    private String mail;

    @Column(name = "_document")
    private Long document;

    @Column
    private LocalDateTime deleted;

    @Override
    public String toString(){
        return "User: id:" + user + ", name: " + firstname + ", lastname: " + lastname;
    }

}
