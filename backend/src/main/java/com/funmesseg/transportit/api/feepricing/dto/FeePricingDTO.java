package com.funmesseg.transportit.api.feepricing.dto;

import com.funmesseg.transportit.model.enums.EFeeType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FeePricingDTO {

    private Long feePricing;

    private EFeeType feeType;

    private float kgprice;

    private float cm3price;
    
}
