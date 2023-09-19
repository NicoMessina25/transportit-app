package com.funmesseg.transportit.model;

import com.funmesseg.transportit.model.enums.EFeeType;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorColumn;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "fee")
@Getter
@Setter
@NoArgsConstructor
@DiscriminatorColumn(name = "feetype", columnDefinition = "bigint")
@DiscriminatorValue(value = "2")
public class FeePricing {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feeid")
    private Long feePricing;

    @Column(name = "feetype", insertable = false, updatable = false)
    @Enumerated(EnumType.ORDINAL)
    private EFeeType feeType;

    @Column
    private float kgprice;

    @Column
    private float cm3price;
}
