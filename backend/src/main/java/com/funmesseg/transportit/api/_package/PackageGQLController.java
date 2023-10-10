package com.funmesseg.transportit.api._package;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api._package.dto.PackageRequest;
import com.funmesseg.transportit.dao._package.PackageDAO;
import com.funmesseg.transportit.model.Package;

@Controller
public class PackageGQLController {
    @Autowired
    private PackageDAO packageDAO;

    @QueryMapping
    public List<Package> packages(){
        return packageDAO.getPackages();
    }

   @QueryMapping
    public Package packagee(@Argument Long id){
        return packageDAO.getPackageById(id);
    }

    @MutationMapping
    public CustomResponse savePackage(@Argument PackageRequest packageRequest){
        return packageDAO.savePackage(packageRequest);
    }

    @MutationMapping
    public CustomResponse updatePackage(@Argument PackageRequest packageRequest){
        return packageDAO.updatePackage(packageRequest);
    }

    @MutationMapping
    public CustomResponse deletePackage(@Argument Long id){
        return packageDAO.deletePackage(id);
    }
}
