package com.funmesseg.transportit.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "cityXcity")
@Getter
@Setter
@NoArgsConstructor
public class CityXCity {
    
    @Id
    @ManyToOne
    @JoinColumn
    private City cityFrom;

    @Id
    @ManyToOne
    @JoinColumn
    private City cityTo;

    @Column
    private float feeCoefficient;
    
    @Column
    private float distanceKm;

}
