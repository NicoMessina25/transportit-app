package com.funmesseg.transportit.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Embeddable
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
public class RouteMapCityId {

    @Column(name = "routemapid")
    private Long routeMapId;

    @Column(name = "cityid")
    private Long cityId;

}
