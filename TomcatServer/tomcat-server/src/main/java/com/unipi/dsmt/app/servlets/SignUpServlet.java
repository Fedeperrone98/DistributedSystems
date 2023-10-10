package com.unipi.dsmt.app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.Optional;

import com.unipi.dsmt.app.daos.UserDAO;
import com.unipi.dsmt.app.entities.User;
import com.unipi.dsmt.app.enums.Department;
import com.unipi.dsmt.app.utils.AccessController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SignUp", value = "/signup")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String targetJSP = "/WEB-INF/jsp/signup.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(targetJSP);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO = new UserDAO((Connection) getServletContext().getAttribute("databaseConnection"));

        String username = Optional.ofNullable(request.getParameter("username")).orElse("");
        String password = Optional.ofNullable(request.getParameter("password")).orElse("");
        String firstname = Optional.ofNullable(request.getParameter("name")).orElse("");
        String surname = Optional.ofNullable(request.getParameter("surname")).orElse("");
        String department = Optional.ofNullable(request.getParameter("department")).orElse("");

        User userInfo = new User(username, password, firstname, surname, true, new Date(System.currentTimeMillis()),
                Department.valueOf(department));

        System.out.println(String.format("[Server] -> Received SignUp Request: %s", userInfo.toString()));

        String resultMessage = userDAO.save(userInfo);

        RequestDispatcher dispatcher = null;
        if (resultMessage != "") {
            response.sendRedirect(String.format("%s/signup?error=%s", request.getContextPath(), resultMessage));
            return;
        }

        AccessController.setToken(request, username);
        dispatcher = request.getRequestDispatcher(request.getContextPath() + "/home");
        dispatcher.forward(request, response);
    }
}
