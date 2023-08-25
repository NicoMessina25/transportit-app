package com.funmesseg.transportit.api.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.funmesseg.transportit.model.Customer;
import com.funmesseg.transportit.api.customer.dto.CustomerDTO;
import com.funmesseg.transportit.dao.customer.CustomerDAO;

@RestController
public class CustomerAPI {
    
    @Autowired
    private CustomerDAO customerDAO;
    
    @GetMapping(value = "/getCustomers")
    public ResponseEntity<List<Customer>> getCustomers(){
        return new ResponseEntity<>(customerDAO.getCustomers(), HttpStatus.OK);
    }

    @GetMapping("/getCustomerById")
    public ResponseEntity<Customer> getCustomerById(@RequestParam int customerId){
        return new ResponseEntity<>(customerDAO.getCustomerById(customerId), HttpStatus.OK);
    }

    @PostMapping("/saveCustomer")
    public void saveCustomer(@RequestBody CustomerDTO customerDTO){
        customerDAO.saveCustomer(customerDTO);
    }

    public void deleteCustomer(int CustomerId){

    }
}
