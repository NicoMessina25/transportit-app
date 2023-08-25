package com.funmesseg.transportit.dao.feepricing;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.feepricing.dto.FeePricingDTO;
import com.funmesseg.transportit.model.FeePricing;

import jakarta.persistence.EntityManager;

@Repository
public class FeePricingDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<FeePricing> getFeePricings(){
        return entityManager.createQuery("from FeePricing", FeePricing.class).getResultList();
    }

    @Transactional(readOnly = true)
    public FeePricing getFeePricingById(int feePricingId){
        return entityManager.find(FeePricing.class, feePricingId);
    }

    @Transactional
    public void saveFeePricing(FeePricingDTO feePricingDTO){
        FeePricing feePricing = new FeePricing();

        feePricing.setFeeType(feePricingDTO.getFeeType());
        feePricing.setKgprice(feePricingDTO.getKgprice());
        feePricing.setCm3price(feePricingDTO.getCm3price());

        entityManager.persist(feePricing);
    }

    @Transactional
    public void deleteFeePricing(int feePricingId){

    }
    
}
