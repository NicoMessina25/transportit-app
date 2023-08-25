package com.funmesseg.transportit.api.movement.dto;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CollectionMovementDTO extends MovementDTO {
    
    private Long shippingrequest;
  
    private Long _package;

}
