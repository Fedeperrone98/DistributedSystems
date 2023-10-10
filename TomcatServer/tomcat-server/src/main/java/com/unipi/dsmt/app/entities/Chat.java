package com.unipi.dsmt.app.entities;

import java.util.List;

import com.google.protobuf.Timestamp;

public class Chat {
    int id;
    User user1;
    User user2;
    List<Message> messages;
    Timestamp creationTime;


    public Chat(int id, User user1, User user2, List<Message> messages, Timestamp creationTime) {
        this.id = id;
        this.user1 = user1;
        this.user2 = user2;
        this.messages = messages;
        this.creationTime = creationTime;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser1() {
        return this.user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return this.user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
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
            " id='" + getId() + "'" +
            ", user1='" + getUser1() + "'" +
            ", user2='" + getUser2() + "'" +
            ", creationTime='" + getCreationTime() + "'" +
            "}";
    }

}
