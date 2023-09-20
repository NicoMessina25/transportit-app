package com.funmesseg.transportit.api.shippingRequest.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.funmesseg.transportit.api._package.dto.PackageRequest;
import com.funmesseg.transportit.model.enums.EShippingState;

public record ShippingRequestRequest(
    Long requestId,
    float price,
    EShippingState state,
    LocalDateTime requestDate,
    Long cityFromId,
    Long cityToId,
    Long customerId,
    List<PackageRequest> packages
) {
    
}
