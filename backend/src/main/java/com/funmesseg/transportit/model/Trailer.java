package com.funmesseg.transportit.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "trailer")
@Getter
@Setter
@NoArgsConstructor
public class Trailer {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long trailerId;

    @Column
    private float weight;

    @Column
    private float payloadWeight;

    @Column
    private String registration;

    @Column(columnDefinition = "bit")
    private boolean available;

    @JoinColumn(name = "parkId")
    @ManyToOne
    private Park park;

    

}
