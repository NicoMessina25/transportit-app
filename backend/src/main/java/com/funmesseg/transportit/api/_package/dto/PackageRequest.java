package com.funmesseg.transportit.api._package.dto;

import com.funmesseg.transportit.model.enums.EShippingState;

public record PackageRequest(
     Long packageId,
     float weight,
     float size,
     float price, 
     EShippingState state,
     Long requestId,
     Long routeMapId,
     String recipientdocument,
     String recipientfirstname,
     //float feeCoefficient,
     float cityFeeCoefficient,
     Long feePricingId
    ) {
    
}
