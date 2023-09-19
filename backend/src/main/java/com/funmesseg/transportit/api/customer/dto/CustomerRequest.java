package com.funmesseg.transportit.api.customer.dto;

public record CustomerRequest(
    Long customerId,
    String firstname,
    String lastname,
    String document,
    String address
) {
    
}
