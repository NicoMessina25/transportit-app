package com.funmesseg.transportit.api.feepricing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.feepricing.dto.FeePricingDTO;
import com.funmesseg.transportit.dao.feepricing.FeePricingDAO;
import com.funmesseg.transportit.model.FeePricing;

@RestController
@RequestMapping("/api/feePricing")
public class FeePricingAPI {

    @Autowired
    private FeePricingDAO feePricingDAO;
    
    @GetMapping(value = "/getFeePricing")
    public ResponseEntity<List<FeePricing>> getFeePricings(){
        return new ResponseEntity<>(feePricingDAO.getFeePricings(), HttpStatus.OK);
    }

    @GetMapping("/getFeePricingById")
    public ResponseEntity<FeePricing> getFeePricingById(@RequestParam int feePricingId){
        return new ResponseEntity<>(feePricingDAO.getFeePricingById(feePricingId), HttpStatus.OK);
    }

    @PostMapping("/saveFeePricing")
    public void saveFeePricing(@RequestBody FeePricingDTO feePricingDTO){
        feePricingDAO.saveFeePricing(feePricingDTO);
    }

    public void deleteFeePricing(int feePricingId){

    }
    
}
