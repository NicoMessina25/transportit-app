package com.funmesseg.transportit.dao.customer;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.customer.dto.CustomerRequest;
import com.funmesseg.transportit.model.Customer;

import jakarta.persistence.EntityManager;

@Repository
public class CustomerDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Customer> getCustomers(){
        return entityManager.createQuery("from Customer where deleted IS NULL", Customer.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Customer getCustomerById(Long customerId){
        return entityManager.find(Customer.class, customerId);
    }

    @Transactional
    public CustomResponse saveCustomer(CustomerRequest customerRequest){
        try {
            entityManager.persist(getCustomerFromRequest(customerRequest));
        } catch (Exception e) {
            
            return new CustomResponse(false, "No se guardó exitosamente: " + e.getMessage());
        }
        
        return new CustomResponse(true, "Se guardó exitosamente: ");
    }

    @Transactional
    public CustomResponse updateCustomer(CustomerRequest customerRequest){
        try {
            entityManager.merge(getCustomerFromRequest(customerRequest));
        } catch (Exception e) {
            return new CustomResponse(false, "No se actualizó exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se actualizó exitosamente: ");
    }

    private Customer getCustomerFromRequest(CustomerRequest customerRequest){
        Customer customer;
        if(customerRequest.customerid() == null)
            customer = new Customer();
        else customer = entityManager.find(Customer.class, customerRequest.customerid());

        customer.setDocument(customerRequest.document());
        customer.setFirstname(customerRequest.firstname());
        customer.setLastname(customerRequest.lastname());
        customer.setAddress(customerRequest.address());

        return customer;
    }

    @Transactional
    public CustomResponse deleteCustomer(Long id){
        try{
            Customer customer = entityManager.getReference(Customer.class, id);
            customer.setDeleted(LocalDateTime.now());
            entityManager.merge(customer);
        } catch (Exception e) {
            return new CustomResponse(false, "No se eliminó exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se eliminó exitosamente: ");
    }

}
