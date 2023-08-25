package com.funmesseg.transportit.model;

import java.util.Date;
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
@Table(name = "shippingRequest")
@Getter
@Setter
@NoArgsConstructor
public class ShippingRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long requestId;

    @Column
    private float price;

    @Enumerated(EnumType.ORDINAL)
    @Column
    private EShippingState state;

    @Column
    private Date requesDate;

    @ManyToOne
    @JoinColumn
    private City cityFrom;

    @ManyToOne
    @JoinColumn
    private City cityTo;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customer;

    @OneToMany(mappedBy = "shippingRequest")
    private List<Package> packages;
}
