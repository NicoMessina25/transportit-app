package com.funmesseg.transportit.api.trailer.dto;

import com.funmesseg.transportit.model.Park;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TrailerDTO {
    
private Long trailerId;

    private float weight;

    private float payloadWeight;

    private String registration;

    private boolean available;

    private Park park;

}
