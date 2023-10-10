package com.unipi.dsmt.app.entities;

import java.util.Date;

import com.google.protobuf.Timestamp;

public class Appointament {
    User host;
    User guest;
    String content;
    Date timeslot;
    Timestamp creationTime;

    public Appointament(User host, User guest, String content, Date timeslot, Timestamp creationTime) {
        this.host = host;
        this.guest = guest;
        this.content = content;
        this.timeslot = timeslot;
        this.creationTime = creationTime;
    }

    public User getHost() {
        return this.host;
    }

    public void setHost(User host) {
        this.host = host;
    }

    public User getGuest() {
        return this.guest;
    }

    public void setGuest(User guest) {
        this.guest = guest;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTimeslot() {
        return this.timeslot;
    }

    public void setTimeslot(Date timeslot) {
        this.timeslot = timeslot;
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
            " host='" + getHost() + "'" +
            ", guest='" + getGuest() + "'" +
            ", content='" + getContent() + "'" +
            ", timeslot='" + getTimeslot() + "'" +
            ", creationTime='" + getCreationTime() + "'" +
            "}";
    }

}
