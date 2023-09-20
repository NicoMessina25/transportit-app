package com.funmesseg.transportit.api.customer.dto;

public record CustomerRequest(
    Long customerid,
    String firstname,
    String lastname,
    String document,
    String address
) {
    
}
