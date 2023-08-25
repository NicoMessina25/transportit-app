package com.funmesseg.transportit.api.feepayment;

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

import com.funmesseg.transportit.api.feepayment.dto.FeePaymentDTO;
import com.funmesseg.transportit.dao.feepayment.FeePaymentDAO;

@RestController
@RequestMapping("/api/feepayment")
public class FeePaymentAPI {

    @Autowired
    private FeePaymentDAO feePaymentDAO;
    
    @GetMapping(value = "/getFeePayments")
    public ResponseEntity<List<FeePaymentDTO>> getFeePayments(){
        return new ResponseEntity<>(feePaymentDAO.getFeePayments(), HttpStatus.OK);
    }

    @GetMapping("/getFeePaymentById")
    public ResponseEntity<FeePaymentDTO> getFeePaymentById(@RequestParam int feePaymentId){
        return new ResponseEntity<>(feePaymentDAO.getFeePaymentById(feePaymentId), HttpStatus.OK);
    }

    @PostMapping("/saveFeePayment")
    public void saveFeePayment(@RequestBody FeePaymentDTO feePaymentDTO){
        feePaymentDAO.saveFeePayment(feePaymentDTO);
    }

    public void deleteFeePayment(int feePaymentId){

    }
    
}
