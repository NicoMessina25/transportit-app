package com.funmesseg.transportit.dao._package;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api._package.dto.PackageDTO;
import com.funmesseg.transportit.model.Customer;
import com.funmesseg.transportit.model.Package;
import com.funmesseg.transportit.model.RouteMap;
import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.enums.EShippingState;

import jakarta.persistence.EntityManager;

@Repository
public class PackageDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Package> getPackages(){
        return entityManager.createQuery("from package", Package.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Package getPackageById(int packageId){
        return entityManager.find(Package.class, packageId);
    }

    @Transactional
    public void savePackage(PackageDTO packageDTO){
        Package p = new Package();

        p.setPackageId(packageDTO.getPackageID());
        p.setWeight(packageDTO.getWeight());
        p.setSize(packageDTO.getSize());
        p.setPrice(packageDTO.getPrice());
        ShippingRequest shippingRequest = entityManager.getReference(ShippingRequest.class, packageDTO.getShippingRequestID());
        p.setShippingRequest(shippingRequest);
        p.setState(packageDTO.getState());
        p.setRecipientDocument(packageDTO.getRecipientDocument());
        p.setRecipientFirstname(packageDTO.getRecipientFirstName());
        p.setCityFeeCoefficient(packageDTO.getFeeCoefficient());

        entityManager.persist(p);
    }

    @Transactional
    public void deletePackage(int packageId){

    }
    
}
