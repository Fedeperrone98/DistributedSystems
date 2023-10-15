package com.unipi.dsmt.app.endpoints.servlets;

import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "MeetingsServlet", value = "/meetings")
public class MeetingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/WEB-INF/jsp/meetings.jsp").forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
