package com.unipi.dsmt.app.entities;

import java.sql.Date;

public class Message {
    private String content;
    private User sender;
    private Date creationTime;
    private int chatID;

    public Message(String content, User sender, Date creationTime, int chatID) {
        this.content = content;
        this.sender = sender;
        this.creationTime = creationTime;
        this.chatID = chatID;
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

    public int getChatID() {
        return this.chatID;
    }

    public void setChatID(int chatID) {
        this.chatID = chatID;
    }

}
