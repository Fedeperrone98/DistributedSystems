package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;

import com.unipi.dsmt.app.daos.MessageDAO;
import com.unipi.dsmt.app.endpoints.handlers.MessageServletHandler;
import com.unipi.dsmt.app.entities.Message;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/message")
public class MessageServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) {
    try {
      Message message = MessageServletHandler.unpackPostMessage(request);
      MessageDAO messageDAO = new MessageDAO((Connection) getServletContext().getAttribute("databaseConnection"));
      messageDAO.save(message);
      response.setStatus(200);
      return;
    } catch (Exception e) {
      ErrorHandler.safeDispatchToErrorPage(request, response, e);
    }
  }
}
