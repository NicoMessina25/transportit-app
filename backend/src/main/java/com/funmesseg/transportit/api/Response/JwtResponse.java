package com.funmesseg.transportit.api.Response;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class JwtResponse {
  private String accessToken;
  private String type = "Bearer";
  private Long userId;
  private String username;
  private String email;
  private LocalDateTime tokenEndDate;

  public JwtResponse(String accessToken, Long userId, String username, String email, LocalDateTime tokenEndDate) {
    this.accessToken = accessToken;
    this.userId = userId;
    this.username = username;
    this.email = email;
    this.tokenEndDate = tokenEndDate;
  }
}
