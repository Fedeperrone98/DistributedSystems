package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;
import java.util.List;

import com.unipi.dsmt.app.daos.ChatDAO;
import com.unipi.dsmt.app.dtos.ChatStorageDTO;
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
            ChatDAO chatDAO = new ChatDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            String currentUsername = AccessController.getUsername(request);
            List<ChatStorageDTO> chats= chatDAO.getChatsFromUsername(currentUsername);
            request.setAttribute("chats", chats);
            request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp").forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
