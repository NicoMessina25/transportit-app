package com.funmesseg.transportit.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "park")
@Getter
@Setter
@NoArgsConstructor
@IdClass(ParkIdClass.class)
public class Park {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "parkid")
    private Long parkId;
    
    @Id
    @JoinColumn(name = "cityid")
    @ManyToOne
    private City city;

    @OneToMany(mappedBy = "park")
    private List<Trailer> trailers;

}
