package com.funmesseg.transportit.api.routeMap.dto;

import java.util.Date;
import java.util.List;

import com.funmesseg.transportit.model.Trailer;
import com.funmesseg.transportit.model.enums.EShippingState;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RouteMapDTO {
    private Long routeMapId;
    private EShippingState state;
    private float payloadVolume;
    private Date startDate;
    private float price;
    private Long driverId;
    private Long truckId;
    private Long trailerId;
    private List<Long> packageIds;
}
