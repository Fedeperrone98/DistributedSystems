package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;
import java.util.ArrayList;

import com.unipi.dsmt.app.daos.UserDAO;
import com.unipi.dsmt.app.dtos.UserDepartmentDTO;
import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DepartmentServlet", value = "/department")
public class DepartmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            UserDAO userDAO = new UserDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            // get users work in that department
            String department = (String) request.getParameter("name");
            ArrayList<UserDepartmentDTO> users = userDAO.getUsersFromDepartment(department);
            request.getSession().setAttribute("users", users);

            // set my_username
            request.getSession().setAttribute("my_username", AccessController.getUsername(request));

            request.getRequestDispatcher("/WEB-INF/jsp/department.jsp").forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
