package com.funmesseg.transportit.dao.shippingRequest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.shippingRequest.dto.ShippingRequestDTO;
import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Customer;
import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.User;

import jakarta.persistence.EntityManager;

@Repository
public class ShippingRequestDAO {
    
    @Autowired
    EntityManager entityManager;

    @Transactional(readOnly = true)
    public List<ShippingRequest> getShippingRequests(){
        return entityManager.createQuery("from shippingRequest", ShippingRequest.class).getResultList();
    }

    @Transactional(readOnly = true)
    public ShippingRequest getShippingRequestById(int requestId){
        return entityManager.find(ShippingRequest.class, requestId);
    }

    @Transactional
    public void saveShippingRequest(ShippingRequestDTO shippingRequestDTO){

        if(shippingRequestDTO.getCityFromId() != null && shippingRequestDTO.getCityToId() != null && shippingRequestDTO.getCustomerId() != null){
            ShippingRequest shippingRequest = new ShippingRequest();

            shippingRequest.setPrice(shippingRequestDTO.getPrice());
            shippingRequest.setRequesDate(shippingRequestDTO.getRequesDate());
            shippingRequest.setState(shippingRequestDTO.getState());

            Customer customer = entityManager.getReference(Customer.class, shippingRequestDTO.getCustomerId());
            City cityFrom =  entityManager.getReference(City.class, shippingRequestDTO.getCityFromId());
            City cityTo = entityManager.getReference(City.class, shippingRequestDTO.getCityToId());

            shippingRequest.setCityFrom(cityFrom);
            shippingRequest.setCityTo(cityTo);
            shippingRequest.setCustomer(customer);

            entityManager.persist(shippingRequest);
        }

    }

}
