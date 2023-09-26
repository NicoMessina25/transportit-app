package com.funmesseg.transportit.security.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.dao.user.UserRepository;
import com.funmesseg.transportit.model.User;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
  @Autowired
  UserRepository userRepository;

  @Override
  @Transactional
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    Optional<User> userOp = userRepository.findByUsername(username);

    if(userOp.isPresent()){
      return UserDetailsImpl.build(userOp.get());
    } else throw new UsernameNotFoundException("User not found, username: " + username);
  
      

    
  }

}
