package com.funmesseg.transportit.dao.trailer;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.trailer.dto.TrailerDTO;
import com.funmesseg.transportit.model.Trailer;

import jakarta.persistence.EntityManager;

@Repository
public class TrailerDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Trailer> getTrailers(){
        return entityManager.createQuery("from Trailer", Trailer.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Trailer getTrailerById(int trailerId){
        return entityManager.find(Trailer.class, trailerId);
    }

    @Transactional
    public void saveTrailer(TrailerDTO trailerDTO){
        Trailer trailer = new Trailer();

        trailer.setWeight(trailerDTO.getWeight());
        trailer.setPayloadWeight(trailerDTO.getPayloadWeight());
        trailer.setRegistration(trailerDTO.getRegistration());
        trailer.setAvailable(trailerDTO.isAvailable());
        trailer.setPark(trailerDTO.getPark());

        entityManager.persist(trailer);
    }

    @Transactional
    public void deleteTrailer(int trailerId){

    }
    
}
