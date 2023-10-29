package com.unipi.dsmt.app.dtos;

import java.sql.Timestamp;

public class NotificationUnpackDTO {
  private String user;
  private String sender;
  private Timestamp creationTime;

  public NotificationUnpackDTO(String user, String sender, Timestamp creationTime) {
    this.user = user;
    this.sender = sender;
    this.creationTime = creationTime;
  }

  public String getUser() {
    return this.user;
  }

  public void setUser(String user) {
    this.user = user;
  }

  public String getSender() {
    return this.sender;
  }

  public void setSender(String sender) {
    this.sender = sender;
  }

  public Timestamp getCreationTime() {
    return this.creationTime;
  }

  public void setCreationTime(Timestamp creationTime) {
    this.creationTime = creationTime;
  }

  @Override
  public String toString() {
    return "{" +
        " user='" + getUser() + "'" +
        ", sender='" + getSender() + "'" +
        ", creationTime='" + getCreationTime() + "'" +
        "}";
  }

}
