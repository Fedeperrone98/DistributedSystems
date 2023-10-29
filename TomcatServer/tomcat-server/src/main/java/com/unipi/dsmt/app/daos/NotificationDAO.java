package com.unipi.dsmt.app.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.unipi.dsmt.app.dtos.NotificationDTO;
import com.unipi.dsmt.app.entities.Notification;

public class NotificationDAO {
  private Connection notificationConnection = null;

  public NotificationDAO(Connection db) {
    notificationConnection = db;
  }

  public int save(Notification notification) throws SQLException {
    String sqlString = "INSERT INTO notification(user, sender, chatID, creationTime) VALUES (?, ?, ?, ?)";
    PreparedStatement statement = notificationConnection.prepareStatement(sqlString, Statement.RETURN_GENERATED_KEYS);
    statement.setString(1, notification.getUser());
    statement.setString(2, notification.getSender());
    statement.setInt(3, notification.getChatID());
    statement.setTimestamp(4, notification.getCreationTime());
    int rowInserted = statement.executeUpdate();

    if (rowInserted == 1) {
      ResultSet generatedKey = statement.getGeneratedKeys();
      if (generatedKey.next()) {
        int insertedRowId = generatedKey.getInt(1);
        return insertedRowId;
      }
    }
    throw new SQLException("Notification not correctly inserted");
  }

  public ArrayList<NotificationDTO> getNotificationFromUser(String user) throws SQLException {
    ArrayList<NotificationDTO> result = new ArrayList<>();
    String sqlString = "SELECT sender, chatID FROM notification WHERE user=? ORDER BY creationTime";
    PreparedStatement statement = notificationConnection.prepareStatement(sqlString);
    statement.setString(1, user);
    ResultSet set = statement.executeQuery();
    while (set.next()) {
      NotificationDTO notification = new NotificationDTO(set.getString("sender"), set.getInt("chatID"));
      result.add(notification);
    }
    return result;
  }

  public void deleteNotificationFromChatID(int chatID) throws SQLException {
    String sqlString = "DELETE FROM notification WHERE chatID=?";
    PreparedStatement statement = notificationConnection.prepareStatement(sqlString);
    statement.setInt(1, chatID);
    statement.executeUpdate();
  }

  public int getNotificationCountForUser(String user) throws SQLException {
    String sqlString = "SELECT COUNT(*) AS notification_number FROM notification WHERE user=?";
    PreparedStatement statement = notificationConnection.prepareStatement(sqlString);
    statement.setString(1, user);
    ResultSet set = statement.executeQuery();
    if (!set.next())
      throw new SQLException("Invalid user");
    return set.getInt("notification_number");
  }

}
