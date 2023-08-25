package com.funmesseg.transportit.dao.city;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.city.dto.CityDTO;
import com.funmesseg.transportit.model.City;

import jakarta.persistence.EntityManager;

@Repository
public class CityDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<City> getCities(){
        return entityManager.createQuery("from city", City.class).getResultList();
    }

    @Transactional(readOnly = true)
    public City getCityById(int cityId){
        return entityManager.find(City.class, cityId);
    }

    @Transactional
    public void saveCity(CityDTO cityDTO){
        City city = new City();

        city.setName(cityDTO.getName());

        entityManager.persist(city);
    }

    @Transactional
    public void deleteCity(int cityId){

    }
    
}
