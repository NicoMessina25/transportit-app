package com.funmesseg.transportit.api.movement.dto;

import jakarta.persistence.Column;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PaymentMovementDTO extends MovementDTO {

     private Long driver;

     private Long routmap;
}
