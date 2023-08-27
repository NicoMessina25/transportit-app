package com.funmesseg.transportit.api.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

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

    @QueryMapping
    public Long authenticate(@Argument UserRequest userRequest){

        Optional<User> optionalUser = userRepository.findByUsername(userRequest.username());

        if(!optionalUser.isEmpty() && optionalUser.get().getPassword().equals(userRequest.password())){
            User userLogged = optionalUser.get();

            Authentication authentication = new UsernamePasswordAuthenticationToken(userLogged, userRequest.password());
            SecurityContextHolder.getContext().setAuthentication(authentication);

            return userLogged.getUser();
        }

        return Long.valueOf(-1);
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
