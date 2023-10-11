package com.unipi.dsmt.app.endpoints.servlets;

import java.io.IOException;

import com.unipi.dsmt.app.utils.AccessController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String token = AccessController.getToken(request);
        if (token == null) {
            request.setAttribute("error", "Invalid Token");
        }
        String targetJSP = token == null ? request.getContextPath() : "/WEB-INF/jsp/home.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetJSP);
        requestDispatcher.forward(request, response);
    }

}
