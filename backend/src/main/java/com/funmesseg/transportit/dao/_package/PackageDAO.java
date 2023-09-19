package com.funmesseg.transportit.dao._package;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api._package.dto.PackageRequest;
import com.funmesseg.transportit.model.FeePricing;
import com.funmesseg.transportit.model.Package;
import com.funmesseg.transportit.model.RouteMap;
import com.funmesseg.transportit.model.ShippingRequest;

import jakarta.persistence.EntityManager;

@Repository
public class PackageDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Package> getPackages(){
        return entityManager.createQuery("from package", Package.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Package getPackageById(Long userId){
        return entityManager.find(Package.class, userId);
    }

    @Transactional
    public CustomResponse saveePackage(PackageRequest packageRequest){
        try {
            entityManager.persist(getPackageFromRequest(null, packageRequest));
        } catch (Exception e) {
            
            return new CustomResponse(false, "No se guardo exitosamente: " + e.getMessage());
        }
        
        return new CustomResponse(true, "Se guardo exitosamente: ");
    }

    @Transactional
    public Package savePackage(PackageRequest packageRequest){
       
        Package packagee = getPackageFromRequest(null ,packageRequest);
        entityManager.persist(packagee);
        return packagee;
        
    }


    @Transactional
    public CustomResponse updateePackage(Long id, PackageRequest packageRequest){
        try {
            entityManager.merge(getPackageFromRequest(id, packageRequest));
        } catch (Exception e) {
            return new CustomResponse(false, "No se actualizo exitosamente: " + e.getMessage());
        }
        return new CustomResponse(true, "Se actualizo exitosamente: ");
    }

    @Transactional
    public Package updatePackage(Long id, PackageRequest packageRequest){
    
        Package packagee = getPackageFromRequest(id, packageRequest);
        entityManager.merge(packagee);
        return packagee;
    }

    private Package getPackageFromRequest(Long id, PackageRequest packageRequest){
        Package packagee;
        if(id == null)
            packagee = new Package();
        else packagee = entityManager.find(Package.class, id);

        ShippingRequest shippingRequest = entityManager.find(ShippingRequest.class, packageRequest.requestId());
        RouteMap routeMap = entityManager.find(RouteMap.class, packageRequest.routeMapId());
        FeePricing feePricing = entityManager.find(FeePricing.class, packageRequest.feePricingId());

        packagee.setWeight(packageRequest.weight());
        packagee.setSize(packageRequest.size());
        packagee.setPrice(packageRequest.price());
        packagee.setState(packageRequest.state());
        packagee.setShippingRequest(shippingRequest);
        packagee.setRouteMap(routeMap);
        packagee.setFeePricing(feePricing);
        packagee.setRecipientDocument(packageRequest.recipientDocument());
        packagee.setRecipientFirstname(packageRequest.recipientFirstName());
        packagee.setCityFeeCoefficient(packageRequest.cityFeeCoefficient());

        return packagee;
    }

    @Transactional
    public List<Package> updatePackagesFromShippingRequest(List<PackageRequest> newPackages, List<Package> oldPackages, Long requestId){
        final List<Package> packages = new ArrayList<>();
        List<PackageRequest> packageToSave = new ArrayList<>();
        List<Package> packagesToDelete = new ArrayList<>();
        List<PackageRequest> packagesToUpdate;



        if(newPackages != null && oldPackages != null){
            
            packageToSave = newPackages.stream().filter(np -> np.packageID() == null).toList();
            packagesToDelete = oldPackages.stream().filter(op -> newPackages.stream().noneMatch(np -> op.getPackageId().equals(np.packageID()))).toList();
            packagesToUpdate = newPackages.stream().filter(np -> oldPackages.stream().anyMatch(op -> op.getPackageId().equals(np.packageID()))).toList(); 

            for(PackageRequest p : packagesToUpdate){
                Package packagee = updatePackage(p.packageID(), new PackageRequest(p.packageID(), p.weight(), p.size(), p.price(), p.state(), p.cityTo(), p.requestId(), p.routeMapId(), p.recipientDocument(), p.recipientFirstName(), p.feeCoefficient(), p.cityFeeCoefficient(), p.feePricingId()));
                packages.add(packagee);
            }


        } else if(newPackages != null) {
            packageToSave = newPackages;
        } else {
            packagesToDelete = oldPackages;
        }
        
        if(packageToSave != null)
            packageToSave.forEach(p -> {
                    Package packagee = savePackage(new PackageRequest(null, p.weight(), p.size(), p.price(), p.state(), p.cityTo(), p.requestId(), p.routeMapId(), p.recipientDocument(), p.recipientFirstName(), p.feeCoefficient(), p.cityFeeCoefficient(), p.feePricingId()));
                    packages.add(packagee);
                });
            
        if(packagesToDelete != null)
            packagesToDelete.forEach(ot -> deletePackage(ot.getPackageId()));

        return packages;
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
