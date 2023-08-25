package com.funmesseg.transportit.dao.driver;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.driver.dto.DriverDTO;
import com.funmesseg.transportit.api.feepayment.dto.FeePaymentDTO;
import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Driver;
import com.funmesseg.transportit.model.FeePayment;
import com.funmesseg.transportit.model.Truck;

import jakarta.persistence.EntityManager;

@Repository
public class DriverDAO {
    
    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Driver> getDrivers(){
        return entityManager.createQuery("from driver", Driver.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Driver getDriverById(int driverId){
        return entityManager.find(Driver.class, driverId);
    }

    @Transactional
    public void saveDriver(DriverDTO driverDTO){
        Driver driver = new Driver();

        driver.setFirstname(driverDTO.getFirstname());
        driver.setLastname(driverDTO.getLastname());
        driver.setDni(driverDTO.getDni());
        driver.setAddress(driverDTO.getAddress());
        driver.setProvince(driverDTO.getProvince());
        driver.setCity(driverDTO.getCity());
        driver.setPhone(driverDTO.getPhone());
        driver.setParticular(driverDTO.isParticular());
        driver.setAvailable(driverDTO.isAvailable());

        FeePayment feePayment = entityManager.getReference(FeePayment.class, driverDTO.getFeepaymentDTO());
        List<Truck> trucks = null;
        if (driver.getTrucks() != null){
            trucks = (List<Truck>) entityManager.getReference(Truck.class, driverDTO.getTrucksid());
        }
        City currentcity = entityManager.getReference(City.class, driverDTO.getCurrentcityid());

        driver.setFeepayment(feePayment);
        driver.setTrucks(trucks);
        driver.setCurrentcityid(currentcity);

        entityManager.persist(driver);
    }

    @Transactional
    public void deleteDriver(int driverId){

    }


}
