package com.unipi.dsmt.app.servlets;

import java.io.IOException;

import com.unipi.dsmt.app.dtos.UserLoginDTO;
import com.unipi.dsmt.app.utils.AccessController;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // User user = UserLoginDTO.checkLogin(username, password);
        Boolean exists = UserLoginDTO.checkLogin(username, password);

        // if (user != null){
        if (exists) {
            // successful login
            AccessController.setToken(request, username);
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            // failed login
            response.sendRedirect(request.getContextPath() + "/index.jsp?r=error");
        }
    }
}
