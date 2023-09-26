package com.funmesseg.transportit.api.trailer.dto;

import com.funmesseg.transportit.api.park.dto.ParkRequest;

public record TrailerRequest(
    Long trailerId,
    float weight,
    float payloadWeight,
    String registration,
    boolean available,
    ParkRequest park
) {
    
}
