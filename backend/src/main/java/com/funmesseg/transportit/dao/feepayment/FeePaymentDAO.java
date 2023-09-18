package com.funmesseg.transportit.dao.feepayment;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.feepayment.dto.FeePaymentDTO;
import com.funmesseg.transportit.api.feepayment.dto.FeePaymentRequest;
import com.funmesseg.transportit.model.Driver;
import com.funmesseg.transportit.model.FeePayment;

import jakarta.persistence.EntityManager;

@Repository
public class FeePaymentDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<FeePaymentDTO> getFeePayments(){
        return entityManager.createQuery("from feepayment", FeePaymentDTO.class).getResultList();
    }

    @Transactional(readOnly = true)
    public FeePaymentDTO getFeePaymentById(int feePaymentId){
        return entityManager.find(FeePaymentDTO.class, feePaymentId);
    }

    @Transactional
    public FeePayment saveFeePayment(FeePaymentRequest feePaymentRequest){
        FeePayment feePayment = new FeePayment();

        feePayment.setKgprice(feePaymentRequest.kgprice());
        feePayment.setKmprice(feePaymentRequest.kmprice());

        Driver driver = null;

        if(feePaymentRequest.driverId() != null){
            driver = entityManager.getReference(Driver.class, feePaymentRequest.driverId());
        }

        feePayment.setDriver(driver);
        feePayment.setRegistrationDate(LocalDateTime.now());

        entityManager.persist(feePayment);

        return feePayment;
    }

    @Transactional
    public void deleteFeePayment(Long feePaymentId){
        try {
            FeePayment feePayment = entityManager.getReference(FeePayment.class, feePaymentId);
            feePayment.setEndDate(LocalDateTime.now());
            entityManager.merge(feePayment);
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    @Transactional
    public FeePayment saveOrUpdateDriverFeePayment(FeePaymentRequest feePaymentRequest, FeePayment oldFeePayment, Long driverId){

        FeePayment feePayment = null;     

        if(feePaymentRequest != null){
            if(feePaymentRequest.feeId() == null){
                if(oldFeePayment != null)
                    deleteFeePayment(oldFeePayment.getFeeId());

                feePayment = saveFeePayment(new FeePaymentRequest(feePaymentRequest.feeId(), driverId, feePaymentRequest.kmprice(), feePaymentRequest.kgprice()));
            }
                
        } else if(oldFeePayment != null)
                    deleteFeePayment(oldFeePayment.getFeeId());
        
        return feePayment;
    }
    
}
