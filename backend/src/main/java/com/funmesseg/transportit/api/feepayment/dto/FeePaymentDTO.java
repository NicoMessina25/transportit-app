package com.funmesseg.transportit.api.feepayment.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FeePaymentDTO {

    private Long feepayment;

    private float kgprice;

    private float kmprice;
    
}
