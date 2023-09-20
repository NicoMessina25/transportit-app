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
    @Column(name = "trailerid")
    private Long trailerId;

    @Column
    private float weight;

    @Column(name = "payloadweight")
    private float payloadWeight;

    @Column
    private String registration;

    @Column(columnDefinition = "bit")
    private boolean available;

    @JoinColumn(name = "parkid")
    @ManyToOne
    private Park park;

    @JoinColumn(name = "cityid")
    @ManyToOne
    private City city;

}
