package com.unipi.dsmt.app.dtos;

public class NotificationDTO {
    private String sender;
    private int chatID;

    public NotificationDTO(String sender, int chatID) {
        this.sender = sender;
        this.chatID = chatID;
    }

    public String getSender() {
        return this.sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public int getChatID() {
        return this.chatID;
    }

    public void setChatID(int chatID) {
        this.chatID = chatID;
    }

    @Override
    public String toString() {
        return "{" +
            " sender='" + getSender() + "'" +
            ", chatID='" + getChatID() + "'" +
            "}";
    }

}
