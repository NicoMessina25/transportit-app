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
@DiscriminatorValue(value = "1")
@DiscriminatorColumn(name = "feetype", columnDefinition = "bigint")
@Table(name = "feepayment")
@Getter
@Setter
@NoArgsConstructor
public class FeePayment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long feepayment;

    @Column(name = "feetype", insertable = false, updatable = false)
    @Enumerated(EnumType.ORDINAL)
    private EFeeType feeType;

    @Column(columnDefinition = "numeric")
    private float kgprice;

    @Column(columnDefinition = "numeric")
    private float kmprice;

    @Override
    public String toString(){
        return "FeePayment: id:" + feepayment + ", $/kg: " + kgprice + ", $/km: " + kmprice;
    }
    
}
