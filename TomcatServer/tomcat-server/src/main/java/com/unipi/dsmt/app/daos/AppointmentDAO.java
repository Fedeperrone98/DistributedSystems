package com.unipi.dsmt.app.daos;

import java.sql.Connection;

public class AppointmentDAO {
    private Connection appointmentConnection = null;

  public AppointmentDAO(Connection db) {
    appointmentConnection = db;
  }
}
