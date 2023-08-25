package com.funmesseg.transportit.dao.park;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.park.dto.ParkDTO;
import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Park;
import com.funmesseg.transportit.model.Trailer;

import jakarta.persistence.EntityManager;

@Repository
public class ParkDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Park> getParks(){
        return entityManager.createQuery("from Park", Park.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Park getParkById(int parkId){
        return entityManager.find(Park.class, parkId);
    }

    @Transactional
    public void savePark(ParkDTO parkDTO){
        Park park = new Park();

        City city = entityManager.getReference(City.class, parkDTO.getCityid());
        
        List<Trailer> trailers = null;
        if (park.getTrailers() != null){
            trailers = (List<Trailer>) entityManager.getReference(Trailer.class, parkDTO.getTrailersid());
        }

        park.setCity(city);
        park.setTrailers(trailers);

        entityManager.persist(park);
    }

    @Transactional
    public void deletePark(int parkrId){

    }
    
}
