package com.funmesseg.transportit.api.routeMap.dto;

import java.util.Date;
import java.util.List;

import com.funmesseg.transportit.api._package.dto.PackageRequest;
import com.funmesseg.transportit.api.driver.dto.DriverRequest;
import com.funmesseg.transportit.api.trailer.dto.TrailerRequest;
import com.funmesseg.transportit.api.truck.dto.TruckRequest;
import com.funmesseg.transportit.model.Trailer;
import com.funmesseg.transportit.model.enums.EShippingState;

public record RouteMapRequest(
    Long routeMapId,
    EShippingState state,
    Float payloadVolume,
    Date startDate,
    Float price,
    DriverRequest driver,
    TruckRequest truck,
    TrailerRequest trailer,
    List<PackageRequest> packages

) {
    
}
