package com.funmesseg.transportit.api.customer;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.customer.dto.CustomerRequest;
import com.funmesseg.transportit.dao.customer.CustomerDAO;
import com.funmesseg.transportit.model.Customer;

@Controller
public class CustomerGQLController {
    
    @Autowired
    private CustomerDAO customerDAO;

    @QueryMapping
    public List<Customer> customers(){
        return customerDAO.getCustomers();
    }

    @QueryMapping
    public Customer customer(@Argument Long customerid){
        return customerDAO.getCustomerById(customerid);
    }

    @MutationMapping
    public CustomResponse saveCustomer(@Argument CustomerRequest customerRequest){
        return customerDAO.saveCustomer(customerRequest);
    }

    @MutationMapping
    public CustomResponse updateCustomer(@Argument CustomerRequest customerRequest){
        return customerDAO.updateCustomer(customerRequest);
        
    }

    @MutationMapping
    public CustomResponse deleteCustomer(@Argument Long customerId){
        return customerDAO.deleteCustomer(customerId);
    }
}
