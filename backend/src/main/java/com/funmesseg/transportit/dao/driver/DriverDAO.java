package com.funmesseg.transportit.dao.driver;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.util.CustomObjectInputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.customer.dto.CustomerRequest;
import com.funmesseg.transportit.api.driver.dto.DriverDTO;
import com.funmesseg.transportit.api.driver.dto.DriverRequest;
import com.funmesseg.transportit.api.feepayment.dto.FeePaymentDTO;
import com.funmesseg.transportit.api.feepayment.dto.FeePaymentRequest;
import com.funmesseg.transportit.api.truck.dto.TruckRequest;
import com.funmesseg.transportit.dao.feepayment.FeePaymentDAO;
import com.funmesseg.transportit.dao.truck.TruckDAO;
import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Customer;
import com.funmesseg.transportit.model.Driver;
import com.funmesseg.transportit.model.FeePayment;
import com.funmesseg.transportit.model.Truck;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class DriverDAO {

    @Autowired
    private TruckDAO truckDAO;

    @Autowired
    private FeePaymentDAO feePaymentDAO;
    
    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Driver> getDrivers(){
        return entityManager.createQuery("SELECT d FROM Driver d " +
        "LEFT JOIN d.feePayments pf " + 
        "LEFT JOIN d.trucks " + 
        "JOIN d.currentcity WHERE d.deleted IS NULL", Driver.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Driver getDriverById(int driverId){
        return entityManager.find(Driver.class, driverId);
    }

    @Transactional
    public CustomResponse saveDriver(DriverRequest driverRequest){
        try {
            Driver driver = getDriverFromRequest(driverRequest);
            entityManager.persist(driver);            
        
            feePaymentDAO.saveOrUpdateDriverFeePayment(driverRequest.fee(), getCurrentFeePayment(driver), driver.getDriverId());  

            if(driverRequest.trucks() != null){
                List<Truck> trucks = new ArrayList<>();
                driverRequest.trucks().forEach(t -> {
                    Truck truck = truckDAO.saveTruck(new TruckRequest(t.truckId(), driver.getDriverId(), t.registration(), t.maxweight(), t.available(), t.cityId()));
                    trucks.add(truck);
                });
            }
            

        } catch (Exception e) {
            log.error("---------------------------------------------------------- " + e.getMessage());
            return new CustomResponse(false, "No se guardo exitosamente: " + e.getMessage());
        }
        
        return new CustomResponse(true, "Se guardo exitosamente: ");
    }

    @Transactional
    public CustomResponse updateDriver(DriverRequest driverRequest){
        try {
            Driver driver = getDriverFromRequest(driverRequest);
            entityManager.merge(driver);


            feePaymentDAO.saveOrUpdateDriverFeePayment(driverRequest.fee(), getCurrentFeePayment(driver), driver.getDriverId());

            truckDAO.updateTrucksFromDriver(driverRequest.trucks(), getCurrentTrucks(driver), driver.getDriverId());

            

        } catch (Exception e) {
            log.error("---------------------------------------------------------- " + e.getMessage());
            return new CustomResponse(false, "No se actualizó exitosamente: " + e.getMessage());
        }
        
        return new CustomResponse(true, "Se actualizó exitosamente: ");
    }

    @Transactional
    public CustomResponse deleteDriver(Long driverId){
        try {
            Driver driver = entityManager.getReference(Driver.class, driverId);
            driver.setDeleted(LocalDateTime.now());
            entityManager.merge(driver);

            driver.getTrucks().forEach(t -> truckDAO.deleteTruck(t.getTruckId()));
            feePaymentDAO.deleteFeePayment(getCurrentFeePayment(driver).getFeeId());            
        } catch (Exception e) {
            log.error("---------------------------------------------------------- " + e.getMessage());
            return new CustomResponse(false, "No se eliminó exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se eliminó exitosamente: ");
    }

    private Driver getDriverFromRequest(DriverRequest driverRequest){
        Driver driver;
        if(driverRequest.driverId() == null)
            driver = new Driver();
        else driver = entityManager.find(Driver.class, driverRequest.driverId());

        driver.setFirstname(driverRequest.firstname());
        driver.setLastname(driverRequest.lastname());
        driver.setDocument(driverRequest.document());
        driver.setAddress(driverRequest.address());
        driver.setProvince(driverRequest.province());
        driver.setCity(driverRequest.city());
        driver.setPhone(driverRequest.phone());
        driver.setParticular(driverRequest.fee() != null || driverRequest.trucks()!=null);
        driver.setAvailable(driverRequest.available());

        City currentcity = entityManager.getReference(City.class, driverRequest.currentcityId());
        driver.setCurrentcity(currentcity);      

        return driver;
    }

    public FeePayment getCurrentFeePayment(Driver driver){
        String query = "FROM FeePayment WHERE endDate IS NULL AND driver.driverId = " + driver.getDriverId();
        TypedQuery<FeePayment> result = entityManager.createQuery(query, FeePayment.class);
        
        if(result.getResultList().isEmpty()){
            return null;
        } else return result.getSingleResult();
    }

    public List<Truck> getCurrentTrucks(Driver driver){
        String query = "FROM Truck WHERE deleted IS NULL AND driver.driverId = " + driver.getDriverId();
        TypedQuery<Truck> result = entityManager.createQuery(query, Truck.class);

        if(result.getResultList().isEmpty()){
            return null;
        } else return result.getResultList();
    }

}
