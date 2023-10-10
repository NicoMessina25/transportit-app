package com.funmesseg.transportit.model;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.funmesseg.transportit.model.enums.EShippingState;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "routemap")
@Getter
@Setter
@NoArgsConstructor
public class RouteMap {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "routemapid")
    private Long routeMapId;

    @Column
    @Enumerated(EnumType.ORDINAL)
    private EShippingState state;

    @Column(name = "payloadvolume")
    private float payloadVolume;

    @Column(name = "startdate")
    private Date startDate;

    @Column 
    private float price;

    @JoinColumn(name = "driverid")
    @ManyToOne
    private Driver driver;

    @JoinColumn(name = "truckid")
    @ManyToOne
    private Truck truck;

    @JoinColumn(name = "trailerid")
    @ManyToOne
    private Trailer trailer;

    @OneToMany(mappedBy = "routeMap")
    private List<Package> packages;

    @JoinColumn(name = "citytoid")
    @ManyToOne
    private City cityTo;

    @JoinColumn(name = "cityfromid")
    @ManyToOne
    private City cityFrom;

    @Column
    private LocalDateTime deleted;

}
