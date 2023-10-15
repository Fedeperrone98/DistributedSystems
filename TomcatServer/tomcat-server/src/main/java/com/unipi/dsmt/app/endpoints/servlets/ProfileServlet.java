package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;

import com.unipi.dsmt.app.daos.UserDAO;
import com.unipi.dsmt.app.dtos.UserProfileDTO;
import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            UserDAO userDAO = new UserDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            String mine = (String) request.getParameter("mine");
            String username;
            if(mine.equals("yes")){
                username = AccessController.getUsername(request);
            }else{
                username = (String) request.getParameter("username");
            }
            UserProfileDTO userInfo = userDAO.getUserFromUsername(username);
            request.setAttribute("user_info", userInfo);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
