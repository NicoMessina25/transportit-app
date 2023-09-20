package com.funmesseg.transportit.api.feepayment.dto;

public record FeePaymentRequest(
    Long feeId,
    Long driverId,
    Float kmprice,
    Float kgprice 
) {
    
}
