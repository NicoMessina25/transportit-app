package com.funmesseg.transportit.dao.user;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.user.dto.UserRequest;
import com.funmesseg.transportit.model.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

@Repository
public class UserDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<User> getUsers(){
        return entityManager.createQuery("from User where deleted IS NULL", User.class).getResultList();
    }

    @Transactional(readOnly = true)
    public User getUserById(Long userId){
        return entityManager.find(User.class, userId);
    }

    @Transactional
    public CustomResponse saveUser(UserRequest userRequest){
        try {
            entityManager.persist(getUserFromRequest(null, userRequest));
        } catch (Exception e) { 
            return new CustomResponse(false, "No se guardo exitosamente: " + e.getMessage());
        } 
        return new CustomResponse(true, "Se guardo exitosamente: ");
        
    }

    @Transactional
    public CustomResponse updateUser(Long id, UserRequest userRequest){
        try{   
            entityManager.merge(getUserFromRequest(id, userRequest));
        } catch (Exception e) { 
            return new CustomResponse(false, "No se actualizo exitosamente: " + e.getMessage());
        } 
        return new CustomResponse(true, "Se actualizo exitosamente: ");
    }

    private User getUserFromRequest(Long id, UserRequest userRequest){
        User user;
        if(id == null)
            user = new User();
        else user = entityManager.find(User.class, id);

        user.setDocument(userRequest.document());
        user.setFirstname(userRequest.firstname());
        user.setLastname(userRequest.lastname());
        user.setMail(userRequest.mail());
        user.setUsername(userRequest.username());
        user.setPassword(userRequest.password());

        return user;
    }

    @Transactional
    public CustomResponse deleteUser(Long id){
        try{
            User u = entityManager.getReference(User.class, id);
            u.setDeleted(LocalDateTime.now());
            entityManager.merge(u);
        } catch (Exception e) { 
            return new CustomResponse(false, "No se elimino exitosamente: " + e.getMessage());
        } 
        return new CustomResponse(true, "Se elimino exitosamente: ");
    }

}
