package com.unipi.dsmt.app.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.unipi.dsmt.app.entities.User;

public class UserDAO {
  private Connection userConnection = null;

  public UserDAO(Connection db) {
    userConnection = db;
  }

  public void save(User userInfo) {
    String sqlString = "INSERT INTO user(username, password, name, surname, department, onlineFlag, creationTime) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try {
      PreparedStatement statement = userConnection.prepareStatement(sqlString);
      statement.setString(1, userInfo.getUsername());
      statement.setString(2, userInfo.getPassword());
      statement.setString(3, userInfo.getName());
      statement.setString(4, userInfo.getSurname());
      statement.setString(5, userInfo.getDepartment().toString());
      statement.setBoolean(6, userInfo.getOnline_flag());
      statement.setDate(7, userInfo.getCreationTime());
      statement.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }

  }

}
