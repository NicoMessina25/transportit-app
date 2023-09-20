package com.funmesseg.transportit.model;


import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Table(name = "driver")
@Getter
@Setter
@NoArgsConstructor
public class Driver {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "driverid")
    private Long driverId;


    @Column
    private String firstname;

    @Column
    private String lastname;

    @Column(name = "_document")
    private String document;
    
    @Column
    private String address;

    @Column
    private String province;

    @Column
    private String city;

    @Column
    private String phone;

    @Column(columnDefinition = "bit")
    private boolean particular;

    @Column(columnDefinition = "bit")
    private boolean available;

    @JoinColumn(name = "feeid")
    @ManyToOne
    private FeePayment fee;

    @OneToMany(mappedBy = "driver")
    private List<Truck> trucks;

    @JoinColumn(name = "currentcityid")
    @ManyToOne
    private City currentcity;

    @Column
    private LocalDateTime deleted;

    @Override
    public String toString(){
        return "Driver: Id:" + driverId + ", name: " + firstname + ", lastname: " + lastname;
    }

}


