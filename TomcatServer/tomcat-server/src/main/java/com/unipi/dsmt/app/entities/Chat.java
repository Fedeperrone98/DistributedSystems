package com.unipi.dsmt.app.entities;

import java.sql.Date;
import java.util.List;

public class Chat {
    private int id;
    private User user1;
    private User user2;
    private List<Message> messages;
    private Date creationTime;

    public Chat(int id, User user1, User user2, List<Message> messages, Date creationTime) {
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

    public List<Message> getMessages() {
        return this.messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
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
            ", user1='" + getUser1() + "'" +
            ", user2='" + getUser2() + "'" +
            ", messages='" + getMessages() + "'" +
            ", creationTime='" + getCreationTime() + "'" +
            "}";
    }

}
