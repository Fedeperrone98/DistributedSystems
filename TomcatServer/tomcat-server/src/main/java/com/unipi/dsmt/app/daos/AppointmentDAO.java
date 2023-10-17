package com.unipi.dsmt.app.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.unipi.dsmt.app.dtos.AppointmentDTO;
import com.unipi.dsmt.app.entities.Appointament;

public class AppointmentDAO {
    private Connection appointmentConnection = null;

  public AppointmentDAO(Connection db) {
    appointmentConnection = db;
  }

  public void save(Appointament appointment) throws SQLException{
    String sqlString = "INSERT INTO chat(host, guest, timeslot, content, creationTime) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement statement = appointmentConnection.prepareStatement(sqlString);
    statement.setString(1, appointment.getHost().getUsername());
    statement.setString(2, appointment.getGuest().getUsername());
    statement.setDate(3, appointment.getTimeslot());
    statement.setString(4, appointment.getContent());
    statement.setDate(5, appointment.getCreationTime());
    statement.executeUpdate();
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

  public void deleteAppointment(String host, String guest, Date timeslot) throws SQLException{
    String sqlString = "DELETE FROM appointment WHERE host=? and guest=? and timeslot=?";
    PreparedStatement statement = appointmentConnection.prepareStatement(sqlString);
    statement.setString(1, host);
    statement.setString(2, guest);
    statement.setDate(3, timeslot);
    statement.executeUpdate();
  }
}
