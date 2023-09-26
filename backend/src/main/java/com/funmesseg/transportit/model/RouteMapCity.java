package com.funmesseg.transportit.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
public class RouteMapCity {
    
    @EmbeddedId
    private RouteMapCityId routeMapCityId;

    @JoinColumn(name = "routemapid")
    @MapsId("routeMapId")
    @ManyToOne
    private RouteMap routeMap;

    @JoinColumn(name = "cityid")
    @MapsId("cityId")
    @ManyToOne
    private City city;

    @Column(name = "arrivaldate")
    private Date arrivalDate;
}
