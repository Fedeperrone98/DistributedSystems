package com.unipi.dsmt.app.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.unipi.dsmt.app.dtos.AppointmentDTO;

public class AppointmentDAO {
    private Connection appointmentConnection = null;

  public AppointmentDAO(Connection db) {
    appointmentConnection = db;
  }

  public ArrayList<AppointmentDTO> getAppointmentsFromUsername(String username) throws SQLException{
    ArrayList<AppointmentDTO> result = new ArrayList<>();
    String sqlString = "SELECT host, guest, content, timeslot FROM appointment WHERE host=? OR guest=?";
    PreparedStatement statement = appointmentConnection.prepareStatement(sqlString);
    statement.setString(1, username);
    statement.setString(2, username);
    ResultSet set = statement.executeQuery();
    while (set.next()) {
      AppointmentDTO appointment = new AppointmentDTO(set.getString("host"), set.getString("guest"),
        set.getString("content"), set.getDate("timeslot"));
      result.add(appointment);
    }
    return result;
  }
}
