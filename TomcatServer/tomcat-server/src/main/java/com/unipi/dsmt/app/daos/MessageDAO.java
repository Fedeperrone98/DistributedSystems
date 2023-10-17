package com.unipi.dsmt.app.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.unipi.dsmt.app.dtos.MessageChatDTO;
import com.unipi.dsmt.app.entities.Message;

public class MessageDAO {
  private Connection messageConnection = null;

  public MessageDAO(Connection db) {
    messageConnection = db;
  }

  public void save(Message message) throws SQLException{
    String sqlString = "INSERT INTO message(content, sender, chatID, creationTime) VALUES (?, ?, ?, ?)";
    PreparedStatement statement = messageConnection.prepareStatement(sqlString);
    statement.setString(1, message.getContent());
    statement.setString(2, message.getSender().getUsername());
    statement.setInt(3, message.getChatID());
    statement.setDate(4, message.getCreationTime());
    statement.executeUpdate();
  }

  public ArrayList<MessageChatDTO> getMessagesFromChatId(int chatId) throws SQLException{
    ArrayList<MessageChatDTO> result = new ArrayList<>();
    String sqlString = "SELECT content, sender, creationTime FROM messages WHERE chatID=?";
    PreparedStatement statement = messageConnection.prepareStatement(sqlString);
    statement.setInt(1, chatId);
    ResultSet set = statement.executeQuery();
    while (set.next()) {
      MessageChatDTO message = new MessageChatDTO(set.getString("content"), set.getString("sender"), 
      set.getDate("creationTime"));
      result.add(message);
    }
    return result;
  }

  public void deleteMessageFromChatID(int chatID) throws SQLException {
    String sqlString = "DELETE FROM message WHERE chatID=?";
    PreparedStatement statement = messageConnection.prepareStatement(sqlString);
    statement.setInt(1, chatID);
    statement.executeUpdate();
  }

  public void deleteMessageFromMessageID(int messageID) throws SQLException {
    String sqlString = "DELETE FROM message WHERE chatID=?";
    PreparedStatement statement = messageConnection.prepareStatement(sqlString);
    statement.setInt(1, messageID);
    statement.executeUpdate();
  }
}
