package com.funmesseg.transportit.api.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.funmesseg.transportit.api.user.dto.UserRequest;
import com.funmesseg.transportit.dao.user.UserDAO;
import com.funmesseg.transportit.model.User;

@Controller
public class UserGQLController {
    
    @Autowired
    UserDAO userDAO;

    @QueryMapping
    public List<User> users(){
        return userDAO.getUsers();
    }

    @QueryMapping
    public User user(@Argument Long id){
        return userDAO.getUserById(id);
    }

    @MutationMapping
    public void saveUser(@Argument UserRequest userRequest){
        userDAO.saveUser(userRequest);
    }

    @MutationMapping
    public void updateUser(@Argument Long id, @Argument UserRequest userRequest){
        userDAO.updateUser(id, userRequest);
    }

    @MutationMapping
    public void deleteUser(@Argument Long id){
        userDAO.deleteUser(id);
    }
}
