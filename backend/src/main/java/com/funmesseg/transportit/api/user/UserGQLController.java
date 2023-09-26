package com.funmesseg.transportit.api.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.Response.CustomResponse;
import com.funmesseg.transportit.api.user.dto.UserRequest;
import com.funmesseg.transportit.dao.user.UserDAO;
import com.funmesseg.transportit.dao.user.UserRepository;
import com.funmesseg.transportit.model.User;

@Controller
public class UserGQLController {
    
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserRepository userRepository;


    @QueryMapping
    public List<User> users(){
        return userDAO.getUsers();
    }

    @QueryMapping
    public User user(@Argument Long id){
        return userDAO.getUserById(id);
    }

    @MutationMapping
    public CustomResponse saveUser(@Argument UserRequest userRequest){
        return userDAO.saveUser(userRequest);
    }

    @MutationMapping
    public CustomResponse updateUser(@Argument Long id, @Argument UserRequest userRequest){
        return userDAO.updateUser(id, userRequest);
    }

    @MutationMapping
    public CustomResponse deleteUser(@Argument Long id){
        return userDAO.deleteUser(id);
    }
}
