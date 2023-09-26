package com.funmesseg.transportit.api.auth;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.Response.JwtResponse;
import com.funmesseg.transportit.api.user.dto.UserRequest;
import com.funmesseg.transportit.dao.user.UserRepository;
import com.funmesseg.transportit.model.User;
import com.funmesseg.transportit.security.jwt.JwtUtils;
import com.funmesseg.transportit.security.services.UserDetailsImpl;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/auth")
public class AuthenticationController {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder encoder;


    @Value("${transportit.app.jwtExpirationMs}")
    private int jwtExpirationMs;

    @Autowired
    JwtUtils jwtUtils;

    @PostMapping("/login")
    public ResponseEntity<?> authenticate(@Valid @RequestBody UserRequest userRequest) {
        List<GrantedAuthority> authorities = Arrays.asList(new SimpleGrantedAuthority("USER"));
        
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(new UserDetailsImpl(null, userRequest.username(), null, null, userRequest.password(), authorities), userRequest.password()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        return ResponseEntity.ok(new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(), userDetails.getEmail(), LocalDateTime.now().plus(jwtExpirationMs, ChronoUnit.MILLIS)));
   
    }

    @GetMapping("/isLogged")
    public boolean isAuthenticated(){
        return true;
    }
}
