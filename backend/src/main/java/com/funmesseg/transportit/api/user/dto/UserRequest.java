package com.funmesseg.transportit.api.user.dto;

public record UserRequest(
    Long user,
    String firstname,
    String lastname,
    String mail,
    Long document,
    String username,
    String password
) {
    
}
