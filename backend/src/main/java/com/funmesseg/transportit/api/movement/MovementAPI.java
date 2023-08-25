package com.funmesseg.transportit.api.movement;

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

import com.funmesseg.transportit.api.movement.dto.MovementDTO;
import com.funmesseg.transportit.dao.Movement.MovementDAO;
import com.funmesseg.transportit.model.Movement;

@RestController
@RequestMapping("/api/movement")
public class MovementAPI {

    @Autowired
    private MovementDAO movementDAO;
    
    @GetMapping(value = "/getMovements")
    public ResponseEntity<List<Movement>> getMovements(){
        return new ResponseEntity<>(movementDAO.getMovements(), HttpStatus.OK);
    }

    @GetMapping("/getMovementById")
    public ResponseEntity<Movement> getMovementById(@RequestParam int movementId){
        return new ResponseEntity<>(movementDAO.getMovementById(movementId), HttpStatus.OK);
    }

    @PostMapping("/saveMovement")
    public void saveMovement(@RequestBody MovementDTO movementDTO){
        movementDAO.saveMovement(movementDTO);
    }

    public void deleteMovement(int movementId){

    }
    
}
