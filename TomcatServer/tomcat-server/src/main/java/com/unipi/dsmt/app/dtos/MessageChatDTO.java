package com.unipi.dsmt.app.dtos;

import java.sql.Date;

public class MessageChatDTO {
    String content;
    String sender;
    Date creationTime;

    public MessageChatDTO(String content, String sender, Date creationTime) {
        this.content = content;
        this.sender = sender;
        this.creationTime = creationTime;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSender() {
        return this.sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Date getCreationTime() {
        return this.creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

}
