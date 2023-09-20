package com.funmesseg.transportit.api.city;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.dao.city.CityDAO;
import com.funmesseg.transportit.model.City;

@Controller
public class CityGQLController {
    @Autowired
    private CityDAO cityDAO;


    @QueryMapping
    public List<City> cities(){
        return cityDAO.getCities();
    }
}
