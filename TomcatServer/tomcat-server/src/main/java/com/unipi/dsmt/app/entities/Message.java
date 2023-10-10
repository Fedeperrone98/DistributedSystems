package com.unipi.dsmt.app.entities;

import com.google.protobuf.Timestamp;

public class Message {
    int id;
    String content;
    User sender;
    Timestamp creationTime;


    public Message(int id, String content, User sender, Timestamp creationTime) {
        this.id = id;
        this.content = content;
        this.sender = sender;
        this.creationTime = creationTime;
    }


    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getSender() {
        return this.sender;
    }

    public void setSender(User sender) {
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
            " id='" + getId() + "'" +
            ", content='" + getContent() + "'" +
            ", sender='" + getSender() + "'" +
            ", creationTime='" + getCreationTime() + "'" +
            "}";
    }
    
}
