package com.funmesseg.transportit.api.customer.dto;

import java.time.LocalDateTime;

public record CustomerRequest(
    Long customerId,
    String firstname,
    String lastname,
    String document,
    String address
) {
    
}
