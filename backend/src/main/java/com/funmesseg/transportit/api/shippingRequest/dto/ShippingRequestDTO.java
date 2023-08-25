package com.funmesseg.transportit.api.shippingRequest.dto;

import java.util.Date;

import com.funmesseg.transportit.model.enums.EShippingState;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ShippingRequestDTO {
    private Long requestId;
    private float price;
    private EShippingState state;
    private Date requesDate;
    private Long cityFromId;
    private Long cityToId;
    private Long customerId;
}
