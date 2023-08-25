package com.funmesseg.transportit.model;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@DiscriminatorValue(value = "1")
@Table(name = "collectionmovement")
@Getter
@Setter
@NoArgsConstructor
public class CollectionMovement extends Movement{

    @Column
    private Long shippingRequest;

    @Column
    private Long _package;

    @Override
    public String toString(){
        return super.toString() + ", shipping requestId: " + shippingRequest + ", packageId: " + _package;
    }

}
