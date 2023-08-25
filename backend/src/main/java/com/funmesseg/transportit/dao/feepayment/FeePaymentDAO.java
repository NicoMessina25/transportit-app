package com.funmesseg.transportit.dao.feepayment;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.feepayment.dto.FeePaymentDTO;
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
    public void saveFeePayment(FeePaymentDTO feePaymentDTO){
        FeePaymentDTO feePayment = new FeePaymentDTO();

        feePayment.setKgprice(feePaymentDTO.getKgprice());
        feePayment.setKmprice(feePaymentDTO.getKmprice());

        entityManager.persist(feePayment);
    }

    @Transactional
    public void deleteFeePayment(int feePaymentId){

    }
    
}
