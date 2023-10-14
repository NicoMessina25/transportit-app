package com.funmesseg.transportit.dao.feepricing;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.feepricing.dto.FeePricingDTO;
import com.funmesseg.transportit.model.FeePayment;
import com.funmesseg.transportit.model.FeePricing;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceException;
import jakarta.persistence.PessimisticLockException;
import jakarta.persistence.QueryTimeoutException;
import jakarta.persistence.TransactionRequiredException;
import jakarta.persistence.TypedQuery;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
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
        feePricing.setCm3price(feePricingDTO.getSize());

        entityManager.persist(feePricing);
    }

    @Transactional
    public void deleteFeePricing(int feePricingId){

    }

    @Transactional(readOnly = true)
    public FeePricing getCompanyFeePricing(){
        TypedQuery<FeePricing> result = entityManager.createQuery("FROM FeePricing WHERE endDate IS NULL AND feeType = 2", FeePricing.class);
        
        try {
            if(result.getResultList().isEmpty()){
                return null;
            } else return result.getSingleResult();
        } catch (IllegalStateException | PersistenceException e) {
            log.error(e.getMessage(), e);
            return null;
        }
        
    }
    
}
