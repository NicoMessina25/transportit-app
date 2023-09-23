package com.funmesseg.transportit.dao.truck;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.city.dto.CityDTO;
import com.funmesseg.transportit.api.driver.dto.DriverDTO;
import com.funmesseg.transportit.api.driver.dto.DriverRequest;
import com.funmesseg.transportit.api.truck.dto.TruckDTO;
import com.funmesseg.transportit.api.truck.dto.TruckRequest;
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
    public Truck saveTruck(TruckRequest truckRequest){
       
        Truck truck = getTruckFromRequest(truckRequest);
        truck.setAvailable(true);
        entityManager.persist(truck);
        return truck;
        
    }

    @Transactional
    public Truck updateTruck(TruckRequest truckRequest){
    
        Truck truck = getTruckFromRequest(truckRequest);
        truck.setAvailable(truckRequest.available());
        entityManager.merge(truck);
        return truck;
    }

    @Transactional
    public CustomResponse deleteTruck(Long truckId){
        try {
            Truck truck = entityManager.getReference(Truck.class, truckId);
            truck.setDeleted(LocalDateTime.now());
            entityManager.merge(truck);
        } catch (Exception e) {
           return new CustomResponse(false, "No se eliminó exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se eliminó exitosamente: ");
    }

    @Transactional
    public List<Truck> updateTrucksFromDriver(List<TruckRequest> newTrucks, List<Truck> oldTrucks, Long driverId){
        final List<Truck> trucks = new ArrayList<>();
        List<TruckRequest> trucksToSave = new ArrayList<>();
        List<Truck> trucksToDelete = new ArrayList<>();
        List<TruckRequest> trucksToUpdate;



        if(newTrucks != null && oldTrucks != null){
            
            trucksToSave = newTrucks.stream().filter(nt -> nt.truckId() == null).toList();
            trucksToDelete = oldTrucks.stream().filter(ot -> newTrucks.stream().noneMatch(nt -> ot.getTruckId().equals(nt.truckId()))).toList();
            trucksToUpdate = newTrucks.stream().filter(nt -> oldTrucks.stream().anyMatch(ot -> ot.getTruckId().equals(nt.truckId()))).toList(); 

            for(TruckRequest t : trucksToUpdate){
                Truck truck = updateTruck(new TruckRequest(t.truckId(), driverId, t.registration(), t.maxweight(), t.available(), t.cityId()));
                trucks.add(truck);
            }


        } else if(newTrucks != null) {
            trucksToSave = newTrucks;
        } else {
            trucksToDelete = oldTrucks;
        }
        
        if(trucksToSave != null)
            trucksToSave.forEach(t -> {
                    Truck truck = saveTruck(new TruckRequest(null, driverId, t.registration(), t.maxweight(), t.available(), t.cityId()));
                    trucks.add(truck);
                });
            
        if(trucksToDelete != null)
            trucksToDelete.forEach(ot -> deleteTruck(ot.getTruckId()));

        return trucks;
    }

    private Truck getTruckFromRequest(TruckRequest truckRequest){
        Truck truck = new Truck();
        Driver driver = null;

        if(truckRequest.driverId() != null)
            driver = entityManager.getReference(Driver.class, truckRequest.driverId());


        City city = null;

        if(truckRequest.cityId() != null){
            city = entityManager.getReference(City.class, truckRequest.cityId());
        }
        
        truck.setDriver(driver);
        truck.setTruckId(truckRequest.truckId());
        truck.setRegistration(truckRequest.registration());
        truck.setRegistrationDate(LocalDateTime.now());
        truck.setMaxweight(truckRequest.maxweight());
        truck.setCity(city);
        
        return truck;
    }

    public List<Truck> getActiveTrucks(List<Truck> trucks){
        return trucks.stream().filter(t -> t.getDeleted() == null).toList();
    }
    
}
