package com.unipi.dsmt.app.endpoints.servlets;

import java.io.IOException;

import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        try {
            response.sendRedirect(request.getContextPath() + "/login");
        } catch (IOException e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
