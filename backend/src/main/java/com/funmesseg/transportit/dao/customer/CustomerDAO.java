package com.funmesseg.transportit.dao.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.customer.dto.CustomerDTO;
import com.funmesseg.transportit.model.Customer;
import com.funmesseg.transportit.model.Customer;

import jakarta.persistence.EntityManager;

@Repository
public class CustomerDAO {
    
    @Autowired
    EntityManager entityManager;

    @Transactional(readOnly = true)
    public List<Customer> getCustomers(){
        return entityManager.createQuery("from customer", Customer.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Customer getCustomerById(int customerId){
        return entityManager.find(Customer.class, customerId);
    }

    @Transactional
    public void saveCustomer(CustomerDTO customerDTO){
        Customer customer = new Customer();

        customer.setAddress(customerDTO.getAddress());
        customer.setDocument(customerDTO.getDocument());
        customer.setFirstname(customerDTO.getFirstname());
        customer.setLastname(customerDTO.getLastname());

        entityManager.persist(customer);
    }
    
}
