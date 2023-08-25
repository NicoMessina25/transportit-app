package com.funmesseg.transportit.model;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorColumn;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import com.funmesseg.transportit.model.enums.EMovement;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "movementtype")
@Table(name = "movement")
@Getter
@Setter
@NoArgsConstructor
public class Movement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long movement;

    @Column(columnDefinition = "numeric")
    private float amounttopay;

    @Column(name = "movementtype", insertable = false, updatable = false)
    @Enumerated(EnumType.ORDINAL)
    private EMovement movementtype;

    @Override
    public String toString(){
        return "Movement: id:" + movement + ", amount: " + amounttopay;
    }
    
}
