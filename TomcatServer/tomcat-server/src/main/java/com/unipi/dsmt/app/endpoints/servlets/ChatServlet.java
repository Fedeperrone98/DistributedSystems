package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;
import java.util.List;

import com.unipi.dsmt.app.daos.MessageDAO;
import com.unipi.dsmt.app.daos.UserDAO;
import com.unipi.dsmt.app.dtos.MessageChatDTO;
import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ChatServlet", value = "/chat")
public class ChatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            int chatID = Integer.parseInt(request.getParameter("chatID"));
            String username = (String) request.getParameter("username");
            request.setAttribute("username", username);
            MessageDAO messageDAO = new MessageDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            UserDAO userDAO = new UserDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            boolean isOnline = userDAO.getOnlineStateOfUsername(username);
            request.setAttribute("isOnline", isOnline);
            List<MessageChatDTO> messageList = messageDAO.getMessagesFromChatId(chatID);
            request.setAttribute("messageList", messageList);
            String currentUsername = AccessController.getUsername(request);
            request.setAttribute("currentUsername", currentUsername);
            request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp").forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
