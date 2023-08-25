package com.funmesseg.transportit.api.trailer;

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

import com.funmesseg.transportit.api.trailer.dto.TrailerDTO;
import com.funmesseg.transportit.dao.trailer.TrailerDAO;
import com.funmesseg.transportit.model.Trailer;

@RestController
@RequestMapping("/api/trailer")
public class TrailerAPI {

    @Autowired
    private TrailerDAO trailerDAO;
    
    @GetMapping(value = "/getTrailers")
    public ResponseEntity<List<Trailer>> getTrailers(){
        return new ResponseEntity<>(trailerDAO.getTrailers(), HttpStatus.OK);
    }

    @GetMapping("/getTrailerById")
    public ResponseEntity<Trailer> getTrailerById(@RequestParam int trailerId){
        return new ResponseEntity<>(trailerDAO.getTrailerById(trailerId), HttpStatus.OK);
    }

    @PostMapping("/saveTrailer")
    public void saveTrailer(@RequestBody TrailerDTO trailerDTO){
        trailerDAO.saveTrailer(trailerDTO);
    }

    public void deleteTrailer(int trailerId){

    }

}
