package com.funmesseg.transportit.model;

import java.time.LocalDateTime;
import java.util.List;

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
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "shippingrequest")
@Getter
@Setter
@NoArgsConstructor
public class ShippingRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "requestid")
    private Long requestId;

    @Column
    private float price;

    @Enumerated(EnumType.ORDINAL)
    @Column
    private EShippingState state;

    @Column(name = "requestdate")
    private LocalDateTime requestDate;

    @ManyToOne
    @JoinColumn(name = "cityfrom")
    private City cityFrom;

    @ManyToOne
    @JoinColumn(name = "cityto")
    private City cityTo;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private Customer customer;

    @OneToMany(mappedBy = "shippingRequest")
    private List<Package> packages;

    @Column
    private LocalDateTime deleted;
    
}
