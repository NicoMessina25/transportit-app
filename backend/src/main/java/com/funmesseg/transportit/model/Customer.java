package com.funmesseg.transportit.model;

import java.security.Timestamp;
import java.time.LocalDateTime;

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
@Table(name = "customer")
@Getter
@Setter
@NoArgsConstructor
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long customerid;

    @Column
    private String firstname;

    @Column
    private String lastname;

    @Column(name = "_document")
    private Long document;

    @Column
    private String address;

    @Column
    private LocalDateTime deleted;
}
