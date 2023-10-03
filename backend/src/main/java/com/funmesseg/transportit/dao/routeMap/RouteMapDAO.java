package com.funmesseg.transportit.dao.routeMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api._package.dto.PackageRequest;
import com.funmesseg.transportit.api.routeMap.dto.RouteMapDTO;
import com.funmesseg.transportit.api.routeMap.dto.RouteMapRequest;
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
        return entityManager.createQuery("from RouteMap", RouteMap.class).getResultList();
    }

    @Transactional(readOnly = true)
    public RouteMap getRouteMapById(Long routeMapId){
        return entityManager.find(RouteMap.class, routeMapId);
    }

    @Transactional
    public CustomResponse saveRouteMap(RouteMapRequest routeMapRequest){
        RouteMap routeMap = new RouteMap();

        routeMap.setPayloadVolume(routeMapRequest.payloadVolume());
        routeMap.setPrice(routeMapRequest.price());
        routeMap.setStartDate(routeMapRequest.startDate());
        routeMap.setState(routeMapRequest.state());
        
        Driver driver = entityManager.getReference(Driver.class, routeMapRequest.driver().driverId());
        Truck truck = entityManager.getReference(Truck.class, routeMapRequest.truck().truckId());
        Trailer trailer = entityManager.getReference(Trailer.class, routeMapRequest.trailer().trailerId());

        for(PackageRequest _package : routeMapRequest.packages()){
            Package p = entityManager.getReference(Package.class, _package.packageId());
            routeMap.getPackages().add(p);
        }

        routeMap.setDriver(driver);
        routeMap.setTrailer(trailer);
        routeMap.setTruck(truck);

        entityManager.persist(routeMap);
        return null;
    }

    @Transactional
    public CustomResponse updateRouteMap(RouteMapRequest routeMapRequest){
        return null;
    }

    @Transactional
    public CustomResponse deleteRouteMap(Long routeMapId){
        return null;
    }
}
