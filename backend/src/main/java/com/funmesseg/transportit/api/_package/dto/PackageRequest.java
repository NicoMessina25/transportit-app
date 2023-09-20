package com.funmesseg.transportit.api._package.dto;

import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.enums.EShippingState;

public record PackageRequest(
     Long packageID,
     float weight,
     float size,
     float price, 
     EShippingState state,
     int cityTo,
     int requestId,
     int routeMapId,
     String recipientDocument,
     String recipientFirstName,
     float feeCoefficient,
     float cityFeeCoefficient,
     float feePricingId
    ) {
    
}
