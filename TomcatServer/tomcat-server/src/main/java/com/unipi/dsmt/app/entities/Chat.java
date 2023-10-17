package com.unipi.dsmt.app.entities;

import java.sql.Date;

public class Chat {
    private User user1;
    private User user2;
    private Date creationTime;

    public Chat(User user1, User user2, Date creationTime) {
        this.user1 = user1;
        this.user2 = user2;
        this.creationTime = creationTime;
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

    public Date getCreationTime() {
        return this.creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

}
