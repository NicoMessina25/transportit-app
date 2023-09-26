package com.funmesseg.transportit.api.truck.dto;

public record TruckRequest(
    Long truckId,
    Long driverId,
    String registration,
    Float maxweight,
    boolean available,
    Long cityId
) {
    
}
