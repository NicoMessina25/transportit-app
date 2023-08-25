package com.funmesseg.transportit.model;

import com.funmesseg.transportit.model.enums.EShippingState;

import jakarta.persistence.Column;
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
@Table(name = "package")
@Getter
@Setter
@NoArgsConstructor
public class Package {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long packageId;

    @Column
    private float weight;

    @Column
    private float size;

    @Column
    private float price;

    @Column
    @Enumerated(EnumType.ORDINAL)
    private EShippingState state;

    @JoinColumn(name = "requestId")
    @ManyToOne
    private ShippingRequest shippingRequest;

    @JoinColumn(name = "routeMapId")
    @ManyToOne
    private RouteMap routeMap;

    @JoinColumn(name = "feePricingId")
    @ManyToOne
    private FeePricing feePricing;

    @Column
    private String recipientDocument;

    @Column 
    private String recipientFirstname;

    @Column
    private float cityFeeCoefficient;


}
