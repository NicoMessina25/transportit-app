package com.funmesseg.transportit.api.city;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.city.dto.CityDTO;
import com.funmesseg.transportit.dao.city.CityDAO;
import com.funmesseg.transportit.model.City;

@RestController
@RequestMapping("/api/city")
public class CityAPI {
    
    @Autowired
    private CityDAO cityDAO;
    
    @GetMapping(value = "/getCities")
    public List<City> getCities(){
        return cityDAO.getCities();
    }

    @GetMapping("/getCityById")
    public City getCityById(@RequestParam int cityId){
        return cityDAO.getCityById(cityId);
    }

    @PostMapping("/saveCity")
    public void saveCity(@RequestBody CityDTO cityDTO){
        cityDAO.saveCity(cityDTO);
    }

    public void deleteCity(int cityId){

    }

}
