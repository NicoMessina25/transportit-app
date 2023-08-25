package com.funmesseg.transportit.dao.routeMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.routeMap.dto.RouteMapDTO;
import com.funmesseg.transportit.model.Driver;
import com.funmesseg.transportit.model.RouteMap;
import com.funmesseg.transportit.model.Trailer;
import com.funmesseg.transportit.model.Truck;
import com.funmesseg.transportit.model.Package;

import jakarta.persistence.EntityManager;

@Repository
public class RouteMapDAO {
    
    @Autowired
    EntityManager entityManager;

     @Transactional(readOnly = true)
    public List<RouteMap> getRouteMaps(){
        return entityManager.createQuery("from routeMap", RouteMap.class).getResultList();
    }

    @Transactional(readOnly = true)
    public RouteMap getRouteMapById(int routeMapId){
        return entityManager.find(RouteMap.class, routeMapId);
    }

    @Transactional
    public void saveRouteMap(RouteMapDTO routeMapDTO){
        RouteMap routeMap = new RouteMap();

        routeMap.setPayloadVolume(routeMapDTO.getPayloadVolume());
        routeMap.setPrice(routeMapDTO.getPrice());
        routeMap.setStartDate(routeMapDTO.getStartDate());
        routeMap.setState(routeMapDTO.getState());
        
        Driver driver = entityManager.getReference(Driver.class, routeMapDTO.getDriverId());
        Truck truck = entityManager.getReference(Truck.class, routeMapDTO.getTruckId());
        Trailer trailer = entityManager.getReference(Trailer.class, routeMapDTO.getTrailerId());

        for(Long packageId : routeMapDTO.getPackageIds()){
            Package p = entityManager.getReference(Package.class, packageId);
            routeMap.getPackages().add(p);
        }

        routeMap.setDriver(driver);
        routeMap.setTrailer(trailer);
        routeMap.setTruck(truck);

        entityManager.persist(routeMap);
    }
}
