package com.funmesseg.transportit.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@DiscriminatorValue(value = "1")
@DiscriminatorColumn(name = "feetype", columnDefinition = "bigint")
@Table(name = "fee")
@Getter
@Setter
@NoArgsConstructor
public class FeePayment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feeid")
    private Long feeId;

    @Column(name = "feetype", insertable = false, updatable = false)
    @Enumerated(EnumType.ORDINAL)
    private EFeeType feeType;

    @Column(columnDefinition = "numeric")
    private float kgprice;

    @Column(columnDefinition = "numeric")
    private float kmprice;

    @Column(name = "registrationdate")
    private LocalDateTime registrationDate;

    @Column(name = "enddate")
    private LocalDateTime endDate;

    @JoinColumn(name = "driverid")
    @ManyToOne
    private Driver driver;

    @Override
    public String toString(){
        return "FeePayment: id:" + feeId + ", $/kg: " + kgprice + ", $/km: " + kmprice;
    }
    
}
