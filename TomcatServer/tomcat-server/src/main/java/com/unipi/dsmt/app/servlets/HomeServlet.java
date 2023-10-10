package com.unipi.dsmt.app.servlets;

import java.io.IOException;

import com.unipi.dsmt.app.utils.AccessController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String token = AccessController.getToken(request);
        if(token == null){
            String targetJSP = "/WEB-INF/jsp/error_login.jsp";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetJSP);
            requestDispatcher.forward(request, response);
            return;
        }
        String targetJSP = "/WEB-INF/jsp/home.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetJSP);
		requestDispatcher.forward(request, response);
    }
    
}
