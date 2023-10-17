package com.unipi.dsmt.app.dtos;

import java.sql.Date;

public class AppointmentDTO {
    String host;
    String guest;
    String content;
    Date timeslot;

    public AppointmentDTO(String host, String guest, String content, Date timeslot) {
        this.host = host;
        this.guest = guest;
        this.content = content;
        this.timeslot = timeslot;
    }

    public String getHost() {
        return this.host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getGuest() {
        return this.guest;
    }

    public void setGuest(String guest) {
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

}
