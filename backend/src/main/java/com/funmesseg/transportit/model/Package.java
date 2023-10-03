package com.funmesseg.transportit.model;

import java.time.LocalDateTime;

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
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "package")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Package {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="packageid")   //poner el name en minuscula para que no convierta las mayusculas en guiones bajos
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

    @JoinColumn(name = "requestid")
    @ManyToOne
    private ShippingRequest shippingRequest;

    @JoinColumn(name = "routemapid")
    @ManyToOne
    private RouteMap routeMap;

    @JoinColumn(name = "feepricingid")
    @ManyToOne
    private FeePricing feePricing;

    @Column(name = "recipientdocument")
    private String recipientDocument;

    @Column(name = "recipientfirstname")
    private String recipientFirstname;

    @Column(name = "cityfeecoefficient")
    private float cityFeeCoefficient;

    @Column
    private LocalDateTime deleted;

}
