package com.unipi.dsmt.app.entities;

import java.sql.Date;

public class Message {
    private int id;
    private String content;
    private User sender;
    private Date creationTime;

    public Message(int id, String content, User sender, Date creationTime) {
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

    public Date getCreationTime() {
        return this.creationTime;
    }

    public void setCreationTime(Date creationTime) {
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
