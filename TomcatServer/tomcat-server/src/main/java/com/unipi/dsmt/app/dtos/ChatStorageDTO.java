package com.unipi.dsmt.app.dtos;

import java.sql.Date;

public class ChatStorageDTO {
    int id_chat;
    String username;
    Date lastMessageTime;

    public ChatStorageDTO(int id_chat, String username, Date lastMessageTime) {
        this.id_chat = id_chat;
        this.username = username;
        this.lastMessageTime = lastMessageTime;
    }

    public int getId_chat() {
        return this.id_chat;
    }

    public void setId_chat(int id_chat) {
        this.id_chat = id_chat;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getLastMessageTime() {
        return this.lastMessageTime;
    }

    public void setLastMessageTime(Date lastMessageTime) {
        this.lastMessageTime = lastMessageTime;
    }

}
