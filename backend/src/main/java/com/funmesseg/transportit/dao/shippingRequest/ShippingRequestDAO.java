package com.funmesseg.transportit.dao.shippingRequest;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api._package.dto.PackageRequest;
import com.funmesseg.transportit.api.shippingRequest.dto.ShippingRequestRequest;
import com.funmesseg.transportit.dao._package.PackageDAO;
import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Customer;
import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.enums.EShippingState;
import com.funmesseg.transportit.model.Package;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ShippingRequestDAO {
    
    @Autowired
    EntityManager entityManager;

    @Autowired
    private PackageDAO packageDAO;

    @Transactional(readOnly = true)
    public List<ShippingRequest> getShippingRequests(){
        return entityManager.createQuery("from shippingRequest where deleted IS NULL", ShippingRequest.class).getResultList();
    }

    @Transactional(readOnly = true)
    public ShippingRequest getShippingRequestById(Long requestId){
        return entityManager.find(ShippingRequest.class, requestId);
    }

    @Transactional(rollbackFor = Exception.class)
    public CustomResponse saveShippingRequest(ShippingRequestRequest shippingRequestRequest){
        try {
            ShippingRequest shippingRequest = getShippingRequestFromRequest(shippingRequestRequest);
            shippingRequest.setRequestDate(LocalDateTime.now());
            shippingRequest.setState(EShippingState.ORDERED);
            entityManager.persist(shippingRequest);            

            if(shippingRequestRequest.packages() != null){
                List<Long> packages = new ArrayList<>();
                shippingRequestRequest.packages().forEach(p -> {
                    Package packagee = entityManager.find(Package.class, p);
                    //packagee = 
                    packageDAO.updatePackage(new PackageRequest(packagee.getPackageId(), packagee.getWeight(), packagee.getSize(), packagee.getPrice(), packagee.getState(), shippingRequest.getRequestId(), packagee.getRouteMap().getRouteMapId(), packagee.getRecipientdocument(), packagee.getRecipientfirstname(), packagee.getCityFeeCoefficient(), packagee.getFeePricing().getFeeId()));
                    packages.add(packagee.getPackageId());
                });
            }
            

        } catch (Exception e) {
            log.error("---------------------------------------------------------- " + e.getMessage());
            return new CustomResponse(false, "No se guardo exitosamente: " + e.getMessage());
        }
        
        return new CustomResponse(true, "Se guardo exitosamente: ");
    }

    @Transactional
    public CustomResponse updateShippingRequest(ShippingRequestRequest shippingRequestRequest){
        try {
            ShippingRequest shippingRequest = getShippingRequestFromRequest(shippingRequestRequest);
            entityManager.merge(shippingRequest);

            packageDAO.updatePackagesFromShippingRequest(shippingRequestRequest.packages(), getCurrentPackages(shippingRequest), shippingRequest.getRequestId());

            

        } catch (Exception e) {
            log.error("---------------------------------------------------------- " + e.getMessage());
            return new CustomResponse(false, "No se actualizó exitosamente: " + e.getMessage());
        }
        
        return new CustomResponse(true, "Se actualizó exitosamente: ");
    }

    @Transactional
    public CustomResponse deleteShippingRequest(Long requestId){
        try {
            ShippingRequest shippingRequest = entityManager.getReference(ShippingRequest.class, requestId);
            shippingRequest.setDeleted(LocalDateTime.now());
            entityManager.merge(shippingRequest);

            shippingRequest.getPackages().forEach(p -> packageDAO.deletePackage(p.getPackageId()));
        } catch (Exception e) {
            log.error("---------------------------------------------------------- " + e.getMessage());
            return new CustomResponse(false, "No se eliminó exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se eliminó exitosamente: ");
    }

    private ShippingRequest getShippingRequestFromRequest(ShippingRequestRequest shippingRequestRequest){
        ShippingRequest shippingRequest;
        if(shippingRequestRequest.requestId() == null)
            shippingRequest = new ShippingRequest();
        else shippingRequest = entityManager.find(ShippingRequest.class, shippingRequestRequest.requestId());

        City cityFrom;
        City cityTo;
        Customer customer;
        if (shippingRequestRequest.cityFromId() != null){
            cityFrom = entityManager.find(City.class, shippingRequestRequest.cityFromId());
            shippingRequest.setCityFrom(cityFrom);
        }
        if (shippingRequestRequest.cityToId() != null){
            cityTo = entityManager.find(City.class, shippingRequestRequest.cityToId());
            shippingRequest.setCityTo(cityTo);
        }
        if (shippingRequestRequest.customerId() != null){
            customer = entityManager.find(Customer.class, shippingRequestRequest.customerId());
            shippingRequest.setCustomer(customer);
        }
        if (Float.valueOf(shippingRequestRequest.price()) != null){
            shippingRequest.setPrice(shippingRequestRequest.price());
        }
        if (shippingRequestRequest.state() != null){
            shippingRequest.setState(shippingRequestRequest.state());
        }
        
        //shippingRequest.setPackages(shippingRequestRequest.packages());

        return shippingRequest;
    }

    public List<Package> getCurrentPackages(ShippingRequest shippingRequest){
        String query = "FROM Package WHERE deleted IS NULL AND shippingRequest.requestId = " + shippingRequest.getRequestId();
        TypedQuery<Package> result = entityManager.createQuery(query, Package.class);

        if(result.getResultList().isEmpty()){
            return null;
        } else return result.getResultList();
    }

}
