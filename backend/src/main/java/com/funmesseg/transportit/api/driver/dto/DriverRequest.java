package com.funmesseg.transportit.api.driver.dto;

import java.util.List;

import com.funmesseg.transportit.api.city.dto.CityRequest;
import com.funmesseg.transportit.api.feepayment.dto.FeePaymentRequest;
import com.funmesseg.transportit.api.truck.dto.TruckRequest;

public record DriverRequest(
    Long driverId,
    String firstname,
    String lastname,
    String document,
    String address,
    String province,
    String city,
    String phone,
    boolean available,
    FeePaymentRequest fee,
    List<TruckRequest> trucks,
    CityRequest currentcity
) {
    
}
