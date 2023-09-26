package com.funmesseg.transportit.api.park.dto;

import java.util.List;

import com.funmesseg.transportit.api.city.dto.CityRequest;
import com.funmesseg.transportit.api.park.dto.ParkRequest;
import com.funmesseg.transportit.api.trailer.dto.TrailerRequest;

public record ParkRequest(
    Long parkId,
    CityRequest city,
    List<TrailerRequest> trailers
) {
    
}
