package com.funmesseg.transportit.dao.Movement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.movement.dto.MovementDTO;
import com.funmesseg.transportit.model.Movement;

import jakarta.persistence.EntityManager;

@Repository
public class MovementDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Movement> getMovements(){
        return entityManager.createQuery("from movement", Movement.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Movement getMovementById(int movementId){
        return entityManager.find(Movement.class, movementId);
    }

    @Transactional
    public void saveMovement(MovementDTO movementDTO){
        Movement movement = new Movement();

        movement.setAmounttopay(movementDTO.getAmounttopay());

        entityManager.persist(movement);
    }

    @Transactional
    public void deleteMovement(int movementId){

    }
    
}
