package com.funmesseg.transportit.api.driver;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.driver.dto.DriverRequest;
import com.funmesseg.transportit.dao.driver.DriverDAO;
import com.funmesseg.transportit.model.Driver;

@Controller
public class DriverGQLController {
    
    @Autowired
    DriverDAO driverDAO;

    @QueryMapping
    public List<Driver> drivers(){
        return driverDAO.getDrivers();
    }

    @QueryMapping
    public Driver driver(@Argument int driverId){
        return driverDAO.getDriverById(driverId);
    }
    
    @MutationMapping
    public CustomResponse saveDriver(@Argument DriverRequest driverRequest){
        return driverDAO.saveDriver(driverRequest);
    }

    @MutationMapping
    public CustomResponse updateDriver(@Argument DriverRequest driverRequest){
        return driverDAO.updateDriver(driverRequest);
    }


    @MutationMapping
    public CustomResponse deleteDriver(@Argument Long driverId){
        return driverDAO.deleteDriver(driverId);
    }
}
