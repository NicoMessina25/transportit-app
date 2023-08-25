package com.funmesseg.transportit.api._package;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api._package.dto.PackageDTO;
import com.funmesseg.transportit.dao._package.PackageDAO;
import com.funmesseg.transportit.model.Package;

@RestController
@RequestMapping("/api/package")
public class PackageAPI {
    
    @Autowired
    private PackageDAO PackageDAO;
    
    @GetMapping(value = "/getPackage")
    public List<Package> getPackages(){
        return PackageDAO.getPackages();
    }

    @GetMapping("/getPackageById")
    public Package getPackageByID(@RequestParam int packageID){
        return PackageDAO.getPackageById(packageID);
    }

    @PostMapping("/savePackage")
    public void savePackage(@RequestBody PackageDTO packageDTO){
        PackageDAO.savePackage(packageDTO);
    }

    public void deletepackage(int packageId){

    }

}
