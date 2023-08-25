package com.funmesseg.transportit.model;

import java.util.List;

import jakarta.persistence.Entity;
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
@Table(name = "park")
@Getter
@Setter
@NoArgsConstructor
public class Park {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long parkId;

    @JoinColumn(name = "cityId")
    @ManyToOne
    private City city;

    @OneToMany(mappedBy = "park")
    private List<Trailer> trailers;

}
