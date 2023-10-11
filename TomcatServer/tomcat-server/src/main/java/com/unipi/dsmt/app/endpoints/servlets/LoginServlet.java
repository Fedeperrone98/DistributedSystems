package com.unipi.dsmt.app.endpoints.servlets;

import java.io.IOException;
import java.sql.Connection;

import com.unipi.dsmt.app.daos.UserDAO;
import com.unipi.dsmt.app.dtos.UserLoginDTO;
import com.unipi.dsmt.app.endpoints.handlers.AuthenticationHandlers;
import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            UserDAO userDAO = new UserDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            UserLoginDTO userInfo = AuthenticationHandlers.unpackPostLogin(request);

            if (!userDAO.exists(userInfo.getUsername())) {
                request.setAttribute("error", "Username doesn't exist");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            if (!userDAO.valid(userInfo.getUsername(), userInfo.getPassword())) {
                request.setAttribute("error", "Incorrect Password");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            AccessController.setToken(request, userInfo.getUsername());
            response.sendRedirect(request.getContextPath() + "/home");
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
