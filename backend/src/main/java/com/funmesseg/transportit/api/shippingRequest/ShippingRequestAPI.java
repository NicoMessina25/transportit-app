package com.funmesseg.transportit.api.shippingRequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.shippingRequest.dto.ShippingRequestDTO;
import com.funmesseg.transportit.dao.shippingRequest.ShippingRequestDAO;
import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.User;

@RestController
@RequestMapping("/api/shippingRequest")
public class ShippingRequestAPI {
    
    @Autowired
    ShippingRequestDAO shippingRequestDAO;

    @GetMapping(value = "/getShippingRequests")
    public ResponseEntity<List<ShippingRequest>> getShippingRequests(){
        return new ResponseEntity<>(shippingRequestDAO.getShippingRequests(), HttpStatus.OK);
    }

    @GetMapping("/getShippingRequestById")
    public ResponseEntity<ShippingRequest> getShippingRequestById(@RequestParam int requestId){
        return new ResponseEntity<>(shippingRequestDAO.getShippingRequestById(requestId), HttpStatus.OK);
    }

    @PostMapping("/saveShippingRequest")
    public void saveShippingRequest(@RequestBody ShippingRequestDTO shippingRequestDTO){
        shippingRequestDAO.saveShippingRequest(shippingRequestDTO);
    }

    public void deleteShippingRequest(@RequestParam int requestId){

    }

}
