package com.funmesseg.transportit.dao.truck;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.city.dto.CityDTO;
import com.funmesseg.transportit.api.driver.dto.DriverDTO;
import com.funmesseg.transportit.api.truck.dto.TruckDTO;
import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Driver;
import com.funmesseg.transportit.model.Truck;

import jakarta.persistence.EntityManager;

@Repository
public class TruckDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Truck> getTrucks(){
        return entityManager.createQuery("from truck", Truck.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Truck getTruckById(int truckId){
        return entityManager.find(Truck.class, truckId);
    }

    @Transactional
    public void saveTruck(TruckDTO truckDTO){
       
       if(truckDTO.getCityId() != null){
            Truck truck = new Truck();
            Driver driver = null;

            if(truckDTO.getDriverId() != null)
                driver = entityManager.getReference(Driver.class, truckDTO.getDriverId());

            City city = entityManager.getReference(City.class, truckDTO.getCityId());
            
            truck.setDriver(driver);
            truck.setDischargedate(truckDTO.getDischargedate());
            truck.setTuition(truckDTO.getTuition());
            truck.setMaxweight(truckDTO.getMaxweight());
            truck.setAvailable(truckDTO.isAvailable());
            truck.setCity(city);
            

            entityManager.persist(truck);
        }
    }

    @Transactional
    public void deleteTruck(int truckId){

    }
    
}
