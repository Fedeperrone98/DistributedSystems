package com.unipi.dsmt.app.entities;

import com.google.protobuf.Timestamp;

public class User {
    String username;
    String password;
    String name;
    String surname;
    enum department{
        IT,
        HR,
        Administration,
        Buying,
        Selling
    };
    Boolean online_flag;
    Timestamp creationTime;


    public User(String username, String password, String name, String surname, Boolean online_flag, Timestamp creationTime) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.online_flag = online_flag;
        this.creationTime = creationTime;
    }


    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Boolean isOnline_flag() {
        return this.online_flag;
    }

    public Boolean getOnline_flag() {
        return this.online_flag;
    }

    public void setOnline_flag(Boolean online_flag) {
        this.online_flag = online_flag;
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
            " username='" + getUsername() + "'" +
            ", password='" + getPassword() + "'" +
            ", name='" + getName() + "'" +
            ", surname='" + getSurname() + "'" +
            ", online_flag='" + isOnline_flag() + "'" +
            ", creationTime='" + getCreationTime() + "'" +
            "}";
    }


}
