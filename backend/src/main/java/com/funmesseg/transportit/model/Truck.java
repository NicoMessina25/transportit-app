package com.funmesseg.transportit.model;

import java.time.LocalDateTime;
import java.util.Date;

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
@Table(name = "truck")
@Getter
@Setter
@NoArgsConstructor
public class Truck {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "truckid")
    private Long truckId;

    @JoinColumn(name = "driver")
    @ManyToOne
    private Driver driver;

    @Column(name = "registrationdate")
    private LocalDateTime registrationDate;
    
    @Column
    private String registration;

    @Column(columnDefinition = "numeric")
    private float maxweight;

    @Column(columnDefinition = "bit")
    private boolean available;

    @JoinColumn(name = "city")
    @ManyToOne
    private City city;

    @Column
    private LocalDateTime deleted;

    @Override
    public String toString(){
        return "Truck: Id:" + truckId + ", driver: " + driver.getFirstname() + " " + driver.getLastname() + ", max weight: " + maxweight;
    }

}
