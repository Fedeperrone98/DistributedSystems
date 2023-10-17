package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.unipi.dsmt.app.daos.ChatDAO;
import com.unipi.dsmt.app.daos.MessageDAO;
import com.unipi.dsmt.app.dtos.MessageChatDTO;
import com.unipi.dsmt.app.entities.Chat;
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
            MessageDAO messageDAO = new MessageDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            ChatDAO chatDAO = new ChatDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            
            String username = (String) request.getParameter("username");
            request.setAttribute("username", username);

            int chatID = Integer.parseInt(request.getParameter("chatID"));

            String currentUsername = AccessController.getUsername(request);
            request.setAttribute("currentUsername", currentUsername);

            List<MessageChatDTO> messageList;
            if(chatID == -1){
                // verifico se esiste già una chat tra currentUsername e username
                int retrievedChatID = chatDAO.getChatIDFromUser1User2(username, currentUsername);
                if(retrievedChatID == -1){
                    // se no creo una nuova chat
                    Chat chat = new Chat(currentUsername, username, new Date(System.currentTimeMillis()));
                    chatDAO.save(chat);
                    request.setAttribute("messageList", null);
                    request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp").forward(request, response);
                    return;
                } else{
                    // altrimenti ottengo il chatID
                    messageList = messageDAO.getMessagesFromChatId(retrievedChatID);
                    request.setAttribute("messageList", messageList);
                    request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp").forward(request, response);
                    return;
                }
            }
            
            messageList = messageDAO.getMessagesFromChatId(chatID);
            request.setAttribute("messageList", messageList);
            
            request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp").forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
