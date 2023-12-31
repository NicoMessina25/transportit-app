package com.funmesseg.transportit.dao._package;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api._package.dto.PackageRequest;
import com.funmesseg.transportit.dao.feepricing.FeePricingDAO;
import com.funmesseg.transportit.model.FeePricing;
import com.funmesseg.transportit.model.Package;
import com.funmesseg.transportit.model.RouteMap;
import com.funmesseg.transportit.model.ShippingRequest;
import com.funmesseg.transportit.model.enums.EShippingState;

import jakarta.persistence.EntityManager;

@Repository
public class PackageDAO {

    @Autowired
    private EntityManager entityManager;

    @Autowired
    private FeePricingDAO feePricingDAO;
    
    @Transactional(readOnly = true)
    public List<Package> getPackages(){
        return entityManager.createQuery("from Package where deleted IS NULL", Package.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Package getPackageById(Long packageId){
        return entityManager.find(Package.class, packageId);
    }

    @Transactional
    public CustomResponse savePackage(PackageRequest packageRequest){
       try{
            Package packagee = getPackageFromRequest(packageRequest);
            FeePricing feePricing = feePricingDAO.getCompanyFeePricing();
            packagee.setFeePricing(feePricing);
            packagee.setState(EShippingState.ORDERED);
            entityManager.persist(packagee);
       } catch (Exception e) {
            return new CustomResponse(false, "No se guardo exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se guardo exitosamente: ");
        
    }

    @Transactional
    public CustomResponse updatePackage(PackageRequest packageRequest){
        try{
            Package packagee = getPackageFromRequest(packageRequest);
            entityManager.merge(packagee);
        } catch (Exception e) {
            return new CustomResponse(false, "No se actualizo exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se actualizo exitosamente: ");
        
    }

    private Package getPackageFromRequest(PackageRequest packageRequest){
        Package packagee;
        if(packageRequest.packageId() == null)
            packagee = new Package();
        else packagee = entityManager.find(Package.class, packageRequest.packageId());

        ShippingRequest shippingRequest;
        RouteMap routeMap;
        FeePricing feePricing;

        packagee.setPackageId(packageRequest.packageId());
        if (Float.valueOf(packageRequest.weight()) != null)
            packagee.setWeight(packageRequest.weight());
        if (Float.valueOf(packageRequest.size()) != null)
            packagee.setSize(packageRequest.size());
        if (Float.valueOf(packageRequest.price()) != null)
            packagee.setPrice(packageRequest.price());
        if (packageRequest.state() != null)
            packagee.setState(packageRequest.state());
        if (packageRequest.requestId() != null){
            shippingRequest = entityManager.find(ShippingRequest.class, packageRequest.requestId());
            packagee.setShippingRequest(shippingRequest);
        }
        if (packageRequest.routeMapId() != null){
            routeMap = entityManager.find(RouteMap.class, packageRequest.routeMapId());
            packagee.setRouteMap(routeMap);
        }
        if (packageRequest.feePricingId() != null){
            feePricing = entityManager.find(FeePricing.class, packageRequest.feePricingId());
            packagee.setFeePricing(feePricing);
        }
        if (packageRequest.recipientdocument() != null)
            packagee.setRecipientdocument(packageRequest.recipientdocument());
        if (packageRequest.recipientfirstname() != null)
            packagee.setRecipientfirstname(packageRequest.recipientfirstname());
        if (Float.valueOf(packageRequest.cityFeeCoefficient()) != null)
            packagee.setCityFeeCoefficient(packageRequest.cityFeeCoefficient());

        return packagee;
    }

    @Transactional
    public CustomResponse updatePackagesFromShippingRequest(List<Long> newPackages, List<Package> oldPackages, Long requestId){
        final List<Package> packages = new ArrayList<>();
        List<Package> packageToSave = new ArrayList<>();
        List<Package> packagesToDelete = new ArrayList<>();
        List<Package> packagesToUpdate = new ArrayList<>();

        try{
            if(newPackages != null && oldPackages != null){                       
                //packageToSave = newPackages.stream().filter(np -> np.packageID() == null).toList();
                packagesToDelete = oldPackages.stream().filter(op -> newPackages.stream().noneMatch(np -> op.getPackageId().equals(np))).toList();//se borran
                //List<Long> pTU = newPackages.stream().filter(np -> oldPackages.stream().anyMatch(op -> op.getPackageId().equals(np))).toList(); //se actualizan

                newPackages.forEach(p -> {
                    Package packagee = entityManager.find(Package.class, p);
                    packagesToUpdate.add(packagee);
                });

                for(Package p : packagesToUpdate){
                    //Package packagee = 

                    updatePackage(new PackageRequest(p.getPackageId(), p.getWeight(), p.getSize(), p.getPrice(), p.getState(), requestId, p.getRouteMap().getRouteMapId(), 
                    p.getRecipientdocument(), p.getRecipientfirstname(), p.getCityFeeCoefficient(), p.getFeePricing().getFeeId()));
                    
                    //packages.add(packagee);
                }

                /*List<Long> pTS = newPackages.stream().filter(np -> oldPackages.stream().noneMatch(op -> op.getPackageId().equals(np))).toList();

                pTS.forEach(p -> {
                    Package packagee = entityManager.find(Package.class, p);
                    packageToSave.add(packagee);
                });*/

            } else if(newPackages != null) {    //los paquetes ya existen, se les actualiza el requestId
                newPackages.forEach(p -> {
                    Package packagee = entityManager.find(Package.class, p);
                    packagesToUpdate.add(packagee);
                });
            } else {
                packagesToDelete = oldPackages;
            }
            
            if(packagesToUpdate != null)
                packagesToUpdate.forEach(p -> {
                    //Package packagee = 

                    updatePackage(new PackageRequest(p.getPackageId(), p.getWeight(), p.getSize(), p.getPrice(), p.getState(), requestId, p.getRouteMap().getRouteMapId(), 
                    p.getRecipientdocument(), p.getRecipientfirstname(), p.getCityFeeCoefficient(), p.getFeePricing().getFeeId()));
                    
                    //packages.add(packagee);
                });
                
            if(packagesToDelete != null)
                packagesToDelete.forEach(ot -> deletePackage(ot.getPackageId()));

        } catch (Exception e) {
            return new CustomResponse(false, "fracaso: " + e.getMessage());
        }
        return new CustomResponse(true, "exito: ");

        
        //return packages;
    }

    @Transactional
    public CustomResponse deletePackage(Long id){
        try{
            Package packagee = entityManager.getReference(Package.class, id);
            packagee.setDeleted(LocalDateTime.now());
            entityManager.merge(packagee);
        } catch (Exception e) {
            return new CustomResponse(false, "No se elimino exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se elimino exitosamente: ");
    }
    
}
