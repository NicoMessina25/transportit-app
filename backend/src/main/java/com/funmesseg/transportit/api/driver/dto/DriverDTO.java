package com.funmesseg.transportit.api.driver.dto;

import java.util.List;

import com.funmesseg.transportit.api.feepayment.dto.FeePaymentDTO;
import com.funmesseg.transportit.api.truck.dto.TruckDTO;
import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Truck;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DriverDTO {
    
    private Long driver;

    private String firstname;

    private String lastname;

    private Long dni;
    
    private String address;

    private String province;

    private String city;

    private Long phone;

    private boolean particular;

    private boolean available;

    private FeePaymentDTO feepaymentDTO;

    private List<Long> trucksid;

    private Long currentcityid;

}
