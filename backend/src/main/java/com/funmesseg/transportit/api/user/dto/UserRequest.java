package com.funmesseg.transportit.api.user.dto;

public record UserRequest(
    Long user,
    String firstname,
    String lastname,
    String mail,
    String document,
    String username,
    String password
) {
    
}
