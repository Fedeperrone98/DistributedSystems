package com.unipi.dsmt.app.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.unipi.dsmt.app.dtos.ChatStorageDTO;

public class ChatDAO {
  private Connection chatConnection = null;

  public ChatDAO(Connection db) {
    chatConnection = db;
  }

  public ArrayList<ChatStorageDTO> getChatsFromUsername(String currentUsername) throws SQLException{
    ArrayList<ChatStorageDTO> result = new ArrayList<>();
    String sqlString = "SELECT chat.user1, chat.user2, chat.id, message.creationTime AS last_message_time" +
                        "FROM chat" + 
                        "INNER JOIN (" + 
                          "SELECT chatID, MAX(creationTime) as max_time FROM message GROUP BY chatID" +
                        ")AS latest_message ON chat.id = latest_message.chatID" +
                        "INNER JOIN message ON chat.id=message.chatID AND latest_message.max_time = message.creationTime" +
                        "WHERE chat.user1=? OR chat.user2=?";
    PreparedStatement statement = chatConnection.prepareStatement(sqlString);
    statement.setString(1, currentUsername);
    statement.setString(2, currentUsername);
    ResultSet set = statement.executeQuery();
    while (set.next()) {
      String user;
      if(set.getString("user1").equals(currentUsername))
        user = set.getString("user2");
      else
        user = set.getString("user1");
      ChatStorageDTO chat = new ChatStorageDTO(set.getInt("chat.id"), user, set.getDate("last_message_time"));
      result.add(chat);
    }
    return result;
  }
}
