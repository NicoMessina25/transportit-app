package com.funmesseg.transportit.api.park;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.park.dto.ParkDTO;
import com.funmesseg.transportit.dao.park.ParkDAO;
import com.funmesseg.transportit.model.Park;

@RestController
@RequestMapping("/api/park")
public class ParkAPI {

    @Autowired
    private ParkDAO parkDAO;
    
    @GetMapping(value = "/getParks")
    public ResponseEntity<List<Park>> getParks(){
        return new ResponseEntity<>(parkDAO.getParks(), HttpStatus.OK);
    }

    @GetMapping("/getParkById")
    public ResponseEntity<Park> getParkById(@RequestParam int parkId){
        return new ResponseEntity<>(parkDAO.getParkById(parkId), HttpStatus.OK);
    }

    @PostMapping("/savePark")
    public void savePark(@RequestBody ParkDTO parkDTO){
        parkDAO.savePark(parkDTO);
    }

    public void deletePark(int parkId){

    }
    
}
