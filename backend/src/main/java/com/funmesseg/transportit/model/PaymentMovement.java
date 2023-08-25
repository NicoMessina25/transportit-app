package com.funmesseg.transportit.model;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@DiscriminatorValue(value = "2")
@Table(name = "paymentmovement")
@Getter
@Setter
@NoArgsConstructor
public class PaymentMovement extends Movement{
    
    @Column
    private Long driver;

    @Column
    private Long routmap;

    @Override
    public String toString(){
        return super.toString() + ", driverId: " + driver + ", roadmapId: " + routmap;
    }

}
