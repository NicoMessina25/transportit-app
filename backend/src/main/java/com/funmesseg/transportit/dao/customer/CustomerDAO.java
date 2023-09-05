package com.funmesseg.transportit.dao.customer;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.customer.dto.CustomerRequest;
import com.funmesseg.transportit.api.trailer.HttpsStatus;
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
            entityManager.persist(getCustomerFromRequest(null, customerRequest));
        } catch (Exception e) {
            
            return new CustomResponse(false, "No se guardo exitosamente: " + e.getMessage());
        }
        
        return new CustomResponse(true, "Se guardo exitosamente: ");
    }

    @Transactional
    public CustomResponse updateCustomer(Long id, CustomerRequest customerRequest){
        try {
            entityManager.merge(getCustomerFromRequest(id, customerRequest));
        } catch (Exception e) {
            return new CustomResponse(false, "No se actualizo exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se actualizo exitosamente: ");
    }

    private Customer getCustomerFromRequest(Long id, CustomerRequest customerRequest){
        Customer customer;
        if(id == null)
            customer = new Customer();
        else customer = entityManager.find(Customer.class, id);

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
            return new CustomResponse(false, "No se elimino exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se elimino exitosamente: ");
    }

}
