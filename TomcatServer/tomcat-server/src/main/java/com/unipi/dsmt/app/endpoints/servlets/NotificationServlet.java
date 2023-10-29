package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;
import java.util.List;

import com.unipi.dsmt.app.daos.ChatDAO;
import com.unipi.dsmt.app.daos.NotificationDAO;
import com.unipi.dsmt.app.dtos.NotificationDTO;
import com.unipi.dsmt.app.dtos.NotificationUnpackDTO;
import com.unipi.dsmt.app.endpoints.handlers.NotificationServletHandler;
import com.unipi.dsmt.app.entities.Notification;
import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "NotificationServlet", value = "/notification")
public class NotificationServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    try {
      NotificationDAO notificationDAO = new NotificationDAO(
          (Connection) getServletContext().getAttribute("databaseConnection"));

      String currentUsername = AccessController.getUsername(request);

      List<NotificationDTO> notificationList = notificationDAO.getNotificationFromUser(currentUsername);
      request.setAttribute("notificationList", notificationList);

      request.getRequestDispatcher("/WEB-INF/jsp/notification.jsp").forward(request, response);
    } catch (Exception e) {
      ErrorHandler.safeDispatchToErrorPage(request, response, e);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) {
    try {
      ChatDAO chatDAO = new ChatDAO((Connection) getServletContext().getAttribute("databaseConnection"));
      NotificationUnpackDTO unpackedNotification = NotificationServletHandler.unpackPostNotification(request);
      int chatID = chatDAO.getChatIDFromUser1User2(unpackedNotification.getSender(), unpackedNotification.getUser());
      System.out
          .println(String.format("[Server] -> Received Notification Post Request for chat: %d with users %s;%s", chatID,
              unpackedNotification.getUser(), unpackedNotification.getSender()));
      Notification notification = new Notification(
          unpackedNotification.getUser(),
          unpackedNotification.getSender(),
          chatID,
          unpackedNotification.getCreationTime());
      NotificationDAO notificationDAO = new NotificationDAO(
          (Connection) getServletContext().getAttribute("databaseConnection"));
      notificationDAO.save(notification);
      response.setStatus(200);
      return;
    } catch (Exception e) {
      ErrorHandler.safeDispatchToErrorPage(request, response, e);
    }
  }
}
